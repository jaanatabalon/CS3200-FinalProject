import pymysql
from tabulate import tabulate
from datetime import datetime
from sqlVar import frogRecords, fishRecords, flowerRecords, mushroomRecords, treeRecords, classRecords, phylumRecords, orderRecords, familyRecords, speciesRecords, countryRecords, researchGroupRecords, institutionRecords, observerRecords, afterDateRecords, betweenDatesRecords, thisUser


# Function to connect to the database
def connect_to_db():
    HOST = 'localhost'
    USER = input("Enter SQL username: ")
    PASSWORD = input("Enter SQL password: ")
    DB = 'creature_spottings' 
    try: 
        db_connect = pymysql.connect(host=HOST, user= USER, password= PASSWORD, 
                                     db=DB,charset='utf8mb4',cursorclass=pymysql.cursors.DictCursor)
        return db_connect
    except Exception as exc:
        return str(exc)

invalid_connection = True
while invalid_connection:
    db_connect = connect_to_db()
    if type(db_connect) != str:
        invalid_connection = False
    else: print("The provided credentials are invalid.")
    

# Function to execute SQL commands
def execute_sql(sql_statement):
    statements = sql_statement.split(';')
    with db_connect.cursor() as cursor:
        for statement in statements:
            cursor.execute(statement)
    db_connect.commit()
    result = cursor.fetchall()
    return result

# Continues prompting user to enter an int until they enter one from the provided list
def get_int_input(valid_val_list, prompt):
    invalid_input = True
    while invalid_input:
        try:
            value = int(input('{}'.format(prompt)))
        except ValueError:
            print('Must enter an integer.')
            continue
        if value in valid_val_list:
            invalid_input = False
        else:
            print('Must enter a value from the list above')
    return value

# Continues prompting user to enter a string until they enter one from the provided list
def get_str_input(valid_val_list, prompt):
    invalid_input = True
    while invalid_input:
        value = input(prompt)
        if value in valid_val_list:
            invalid_input = False
        else:
            print('Must enter a valid value')
    return value

# Continues prompting user to enter a date until it matches the YYYY-MM-DD format
def get_date_input():
    invalid_input = True
    while invalid_input:
        date = input("Date (YYYY-MM-DD): ")
        format = "%Y-%m-%d"
        res = True
        try:
            res = bool(datetime.strptime(date, format))
        except ValueError:
            res = False
        if res:
            invalid_input = False
        else:
            print("Must format date as YYYY-MM-DD")
    return date

# Adding a new row into user table
def add_user():
    first_name = input('First Name: ')
    last_name = input('Last Name: ')
    name = first_name + ' ' + last_name

    institution_stmt = 'SELECT institutionCode FROM institution'
    institutions = execute_sql(institution_stmt)
    print('Choose your institution from the following list: ')
    inst_list = []
    for row in institutions:
        inst_list.append(row['institutionCode'])
    print(inst_list)
    
    institution = get_str_input(inst_list, 'Institution: ')
    print('Choose your research group from the following list: ')
    rgid_stmt = 'SELECT rgid, name FROM research_group'
    rgids = execute_sql(rgid_stmt)
    rgid_list = []
    for row in rgids:
        print(str(row['rgid']) + '   ' + row['name'])
        rgid_list.append(row['rgid'])

    group = get_int_input(rgid_list, 'Research group ID: ')
    
    insert_obs_proc = "CALL insert_observer('{}', '{}', '{}')".format(name, institution, group)
    execute_sql(insert_obs_proc)

# Logging a user in
def log_in():
    name_stmt = 'SELECT name FROM observer'
    names = execute_sql(name_stmt)
    name_list = []
    for row in names:
        name_list.append(row['name'])
    name = get_str_input(name_list, 'Log in (enter name): ')
    sql = "SELECT oid FROM observer WHERE name = '{}'".format(name)
    oid_sql = execute_sql(sql)
    for row in oid_sql:
        oid = row['oid']
    return oid

# Adds an occurrence record from the provided user input
def add_occurrence_record(oid):
    bor = input("Basis of record: ")
    
    date = get_date_input()

    print("This confirmation code can be used to modify records in the future.")
    confirmCodes = execute_sql('SELECT confirmCode FROM occurrence_record')
    code_list = []
    for row in confirmCodes:
        code_list.append(row['confirmCode'])
    invalidCode = True
    while invalidCode:
        confirmationCode = input("10-digit confirmation code: ")
        if confirmationCode.upper() in code_list:
            print("This confirmation code is already taken.")
        else: 
            invalidCode = False

    insert_ocr_proc = "CALL insert_occurrence_record('{}', '{}', '{}')".format(bor, date, confirmationCode)
    execute_sql(insert_ocr_proc)
    retrieve_ocid = "SELECT ocid FROM occurrence_record WHERE confirmCode = '{}'".format(confirmationCode)
    ocid_sql = execute_sql(retrieve_ocid)
    for row in ocid_sql:
        ocid = row['ocid']

    stateProv = input("State/Province found: ")
    country = input("Country found: ")
    locality = input("Locality found: ")
    insert_location_proc = "CALL insert_location('{}', '{}', '{}')".format(stateProv, country, locality)
    execute_sql(insert_location_proc)

    pictureurl = input("Picture URL of observed specimen: ")
    species_stmt = "SELECT speciesKey, species FROM species"
    all_species = execute_sql(species_stmt)
    species_list = []
    for row in all_species:
        print(str(row['speciesKey']) + '   ' + row['species'])
        species_list.append(row['speciesKey'])
    species = get_int_input(species_list, "Species observed: ")
    insert_lc_proc = "CALL insert_living_creature('{}', '{}')".format(pictureurl, species)
    execute_sql(insert_lc_proc)
    retrieve_lcid = "SELECT lcid FROM living_creature WHERE pictureUrl = '{}'".format(pictureurl)
    lcid_sql = execute_sql(retrieve_lcid)
    for row in lcid_sql:
        lcid = row['lcid']
    
    insert_found_in_proc = "CALL insert_found_in({}, '{}', '{}', '{}')".format(lcid, stateProv, country, locality)
    execute_sql(insert_found_in_proc)
    insert_observes_proc = "CALL insert_observes({}, {}, {})".format(ocid, oid, lcid)
    execute_sql(insert_observes_proc)

    flora_fauna_options = '''
Options:
0: flora
1: fauna'''
    print(flora_fauna_options)
    valid_flora_fauna_options = [0, 1]
    flora_or_fauna = get_int_input(valid_flora_fauna_options, "Flora/Fauna: ")
    
    if flora_or_fauna == 0:
        add_flora_record(lcid)
    else:
        add_fauna_record(lcid)
    read_my_records(oid)     

# Adds a flora record from the provided user input
def add_flora_record(lcid):
    flora_options = '''
Options:
0: flower
1: tree
2: mushroom'''
    print(flora_options)
    valid_flora_options = [0, 1, 2]
    flora = get_int_input(valid_flora_options, "Flora type: ")
    if flora == 0:
        add_flower_record(lcid)
    elif flora == 1:
        add_tree_record(lcid)
    else:
        add_mushroom_record(lcid)

# Adds a flower record from the provided user input
def add_flower_record(lcid):
    szn = input("Season found: ")
    num_petals = int(input("Number of petals: "))
    insert_flower_proc = "CALL insert_flower('{}', '{}', '{}')".format(num_petals, szn, lcid)
    execute_sql(insert_flower_proc)

# Adds a tree record from the provided user input
def add_tree_record(lcid):
    szn = input("Season found: ")
    height = int(input("Height (in feet): "))
    insert_tree_proc = "CALL insert_tree('{}', '{}', '{}')".format(height, szn, lcid)
    execute_sql(insert_tree_proc)

# Adds a mushroom record from the provided user input
def add_mushroom_record(lcid):
    szn = input("Season found: ")
    height = int(input("Height (in inches): "))
    insert_mushroom_proc = "CALL insert_mushroom('{}', '{}', '{}')".format(height, szn, lcid)
    execute_sql(insert_mushroom_proc)

# Adds a fauna record from the provided user input
def add_fauna_record(lcid):
    fauna_options = '''
Options:
0: fish
1: frog'''
    print(fauna_options)
    valid_fauna_options = [0, 1]
    fauna = get_int_input(valid_fauna_options, "Fauna type: ")

    if fauna == 0:
        add_fish_record(lcid)    
    else:
        add_frog_record(lcid)  

# Adds a fish record from the provided user input
def add_fish_record(lcid):
    szn = input("Season found: ")
    length = int(input("Length (in inches): "))
    insert_fish_proc = "CALL insert_fish('{}', '{}', '{}')".format(length, szn, lcid)
    execute_sql(insert_fish_proc)

# Adds a frog record from the provided user input
def add_frog_record(lcid):
    szn = input("Season found: ")
    length = int(input("Length (in inches): "))
    insert_frog_proc = "CALL insert_frog('{}', '{}', '{}')".format(length, szn, lcid)
    execute_sql(insert_frog_proc)
    
# Deletes an occurrence record
def delete_observation(oid):
    valid_confirmation = "SELECT confirmCode FROM occurrence_record NATURAL JOIN observes WHERE oid = {}".format(oid)
    confirmation_codes = execute_sql(valid_confirmation)
    confirm_list = []
    for row in confirmation_codes:
        confirm_list.append(row['confirmCode'])
    confirmation_code = get_str_input(confirm_list, "Confirmation Code: ")
    ocid_stmt = "SELECT ocid FROM occurrence_record WHERE '{}' = confirmCode".format(confirmation_code)
    ocid_sql = execute_sql(ocid_stmt)
    for row in ocid_sql:
        ocid = row['ocid']
    ocid_proc = "CALL delete_occurrence_record({})".format(ocid)
    execute_sql(ocid_proc)

# Provides the appropriate sql statement to retrieve observation records according to the creature type
def return_observation_record(confirmCode):
    get_ocid = "SELECT ocid FROM occurrence_record WHERE confirmCode = '{}'".format(confirmCode)
    ocid_sql = execute_sql(get_ocid)
    for row in ocid_sql:
        ocid = row['ocid']
    get_lcid = "SELECT lcid FROM observes WHERE ocid = {}".format(ocid)
    lcid_sql = execute_sql(get_lcid)
    for row in lcid_sql:
        lcid = row['lcid']
    creature = what_creature(lcid)
    if creature == "frog":
        ocr_stmt = frogRecords.format(confirmCode)
    elif creature == "fish":
        ocr_stmt = fishRecords.format(confirmCode)
    elif creature == "flower":
        ocr_stmt = flowerRecords.format(confirmCode)
    elif creature == "mushroom":
        ocr_stmt = mushroomRecords.format(confirmCode)
    elif creature == "tree":
        ocr_stmt = treeRecords.format(confirmCode)
    else:
        ocr_stmt = ""
    return ocr_stmt

# Modifies an existing observation record from user input
def modify_observation_record(oid):
    valid_code_list = []
    valid_codes_stmt = "SELECT confirmCode FROM occurrence_record NATURAL JOIN observes WHERE observes.oid='{}'".format(oid)
    valid_codes_sql = execute_sql(valid_codes_stmt)
    for row in valid_codes_sql:
        valid_code_list.append(row['confirmCode'])
    confirmCode = get_str_input(valid_code_list, "Observation confirmation code: ")

    modifyTasks = '''
Options:
0: date
1: picture URL
2: season found
3: location
4: creature measurements
    '''
    print(modifyTasks)
    ocr_stmt = return_observation_record(confirmCode)
    ocr_sql = execute_sql(ocr_stmt)
    print("Current record: ")
    if (tabulate(ocr_sql, headers="keys", tablefmt="simple")) == "":
        print("There are no records associated with that confirmation code.")
    else: print(tabulate(ocr_sql, headers="keys", tablefmt="simple"))
    options_list = [0,1,2,3,4]
    task = get_int_input(options_list, "Modify which aspect: ")
    if task == 0:
        newDate = get_date_input()
        updateCall = "CALL update_date('{}', '{}')".format(newDate, confirmCode)
    elif task == 1:
        newURL = input("Picture URL: ")
        updateCall = "CALL update_url('{}', '{}')".format(newURL, confirmCode)
    elif task == 2:
        get_ocid = "SELECT ocid FROM occurrence_record WHERE confirmCode='{}'".format(confirmCode)
        ocid_sql = execute_sql(get_ocid)
        for row in ocid_sql:
            ocid = row['ocid']
        get_lcid = "SELECT lcid FROM observes WHERE ocid={}".format(ocid)
        lcid_sql = execute_sql(get_lcid)
        for row in lcid_sql:
            lcid = row['lcid']
        creature = what_creature(lcid)
        updateCall = update_szn(creature, confirmCode)
    elif task == 3:
        newStateProv = input("State/Province: ")
        newCountry = input("Country (2 digit country code): ")
        newLocality = input("Locality: ")
        updateCall = "CALL update_location('{}', '{}', '{}', '{}')".format(newStateProv, newCountry, newLocality, confirmCode)
    elif task == 4:
        get_ocid = "SELECT ocid FROM occurrence_record WHERE confirmCode='{}'".format(confirmCode)
        ocid_sql = execute_sql(get_ocid)
        for row in ocid_sql:
            ocid = row['ocid']
        get_lcid = "SELECT lcid FROM observes WHERE ocid={}".format(ocid)
        lcid_sql = execute_sql(get_lcid)
        for row in lcid_sql:
            lcid = row['lcid']
        creature = what_creature(lcid)
        updateCall = update_creature(creature, confirmCode)
    else:
        modify_observation_record(oid)
    execute_sql(updateCall)
    print("\nUpdated record: ")
    ocr_stmt = return_observation_record(confirmCode)
    ocr_sql = execute_sql(ocr_stmt)
    if (tabulate(ocr_sql, headers="keys", tablefmt="simple")) == "":
        print("There are no records that were modified.")
    else: print(tabulate(ocr_sql, headers="keys", tablefmt="simple"))
    
# Updates the season in which a creature was found
def update_szn(creature, confirmCode):
    newSzn = input("Season found: ")
    if creature == "frog":
        updateCall = "CALL update_frogSzn('{}', '{}')".format(newSzn, confirmCode)
    elif creature == "fish":
        updateCall = "CALL update_fishSzn('{}', '{}')".format(newSzn, confirmCode)
    elif creature == "flower":
        updateCall = "CALL update_flowerSzn('{}', '{}')".format(newSzn, confirmCode)
    elif creature == "mushroom":
        updateCall = "CALL update_mushroomSzn('{}', '{}')".format(newSzn, confirmCode)
    elif creature == "tree":
        updateCall = "CALL update_treeSzn('{}', '{}')".format(newSzn, confirmCode)
    else:
        updateCall = ""
    return updateCall

# Updates the measurements of a creature
def update_creature(creature, confirmCode):
    if creature == "frog":
        length = input("Length (in inches): ")
        updateCall = "CALL update_frogLength({}, '{}')".format(length, confirmCode)
    elif creature == "fish":
        length = input("Length (in inches): ")
        updateCall = "CALL update_fishLength({}, '{}')".format(length, confirmCode)
    elif creature == "flower":
        petals = input("Number of petals: ")
        updateCall = "CALL update_flowerPetals({}, '{}')".format(petals, confirmCode)
    elif creature == "mushroom":
        height = input("Height (in inches): ")
        updateCall = "CALL update_mushroomHeight({}, '{}')".format(height, confirmCode)
    elif creature == "tree":
        height = input("Heignt (in feet): ")
        updateCall = "CALL update_treeHeight({}, '{}')".format(height, confirmCode)
    else:
        updateCall = ""
    return updateCall

# Returns the subclass associated with the given living creature id
def what_creature(lcid):
    fish_list = []
    frog_list = []
    tree_list = []
    flower_list = []
    mushroom_list = []

    fish_stmt = "SELECT fiid FROM fauna_fish WHERE faunaLivingCreatureFK = {}".format(lcid)
    frog_stmt = "SELECT frid FROM fauna_frog WHERE faunaLivingCreatureFK = {}".format(lcid)
    tree_stmt = "SELECT tid FROM flora_tree WHERE floraLivingCreatureFK = {}".format(lcid)
    flower_stmt = "SELECT flid FROM flora_flower WHERE floraLivingCreatureFK = {}".format(lcid)
    mushroom_stmt = "SELECT mid FROM flora_mushroom WHERE floraLivingCreatureFK = {}".format(lcid)
    fishes = execute_sql(fish_stmt)
    frogs = execute_sql(frog_stmt)
    trees = execute_sql(tree_stmt)
    flowers = execute_sql(flower_stmt)
    mushrooms = execute_sql(mushroom_stmt)

    for row in fishes:
        fish_list.append(row["fiid"])
    for row in frogs:
        frog_list.append(row["frid"])
    for row in trees:
        tree_list.append(row["tid"])
    for row in flowers:
        flower_list.append(row["flid"])
    for row in mushrooms:
        mushroom_list.append(row["mid"])
        
    if len(fish_list) > 0:
        return "fish"
    elif len(frog_list) > 0:
        return "frog"
    elif len(tree_list) > 0:
        return "tree"
    elif len(flower_list) > 0:
        return "flower"
    elif len(mushroom_list) > 0:
        return "mushroom"
    else: return "unknown"

# Read all records of a specific class
def read_class():
    classes = execute_sql('SELECT DISTINCT class FROM species')
    print('Classes: ')
    class_list = []
    for row in classes:
        class_list.append(row['class'])
    print(class_list)

    class_input = get_str_input(class_list, "Class: ")

    sql = classRecords.format(class_input, class_input, class_input, class_input, class_input, class_input, class_input, class_input, class_input, class_input)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no record of the specified class.")
    else: print(tabulate(query, headers="keys", tablefmt="simple"))
    
# Read all records of a specific phylum
def read_phylum():
    phylums = execute_sql('SELECT DISTINCT phylum FROM species')
    print('Phylums: ')
    phylum_list = []
    for row in phylums:
        phylum_list.append(row['phylum'])
    print(phylum_list)

    phylum_input = get_str_input(phylum_list, "Phylum: ")

    sql = phylumRecords.format(phylum_input, phylum_input, phylum_input, phylum_input, phylum_input, phylum_input, phylum_input, phylum_input, phylum_input, phylum_input)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no record of the specified phylum.")
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records of a order
def read_order():
    orders = execute_sql('SELECT DISTINCT speciesOrder FROM species')
    print('Orders: ')
    order_list = []
    for row in orders:
        order_list.append(row['speciesOrder'])
    print(order_list)

    order_input = get_str_input(order_list, "Order: ")

    sql = orderRecords.format(order_input, order_input, order_input, order_input, order_input, order_input, order_input, order_input, order_input, order_input)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no record of the specified order.")
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records of a family
def read_family():
    families = execute_sql('SELECT DISTINCT family FROM species')
    print('Families: ')
    family_list = []
    for row in families:
        family_list.append(row['family'])
    print(family_list)

    family_input = get_str_input(family_list, "Family: ")

    sql = familyRecords.format(family_input, family_input, family_input, family_input, family_input, family_input, family_input, family_input, family_input, family_input)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no record of the specified family.")
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records of a species
def read_species():
    species = execute_sql('SELECT DISTINCT species FROM species')
    print('Species: ')
    species_list = []
    for row in species:
        species_list.append(row['species'])
    print(species_list)

    species_input = get_str_input(species_list, "Species: ")

    sql = speciesRecords.format(species_input, species_input, species_input, species_input, species_input, species_input, species_input, species_input, species_input, species_input)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no record of the specified species.")
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records from a certain country
def read_country():
    countries = execute_sql('SELECT DISTINCT countryCode FROM location')
    print('Countries: ')
    country_list = []
    for row in countries:
        country_list.append(row['countryCode'])
    print(country_list)

    country_input = get_str_input(country_list, "Country: ")

    sql = countryRecords.format(country_input, country_input, country_input, country_input, country_input, country_input, country_input, country_input, country_input, country_input)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no records from the country '{}'.".format(country_input))
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records from a certain research_group
def read_research_group():
    groups = execute_sql('SELECT DISTINCT name FROM research_group')
    print('Research groups: ')
    group_list = []
    for row in groups:
        group_list.append(row['name'])
    print(group_list)

    invalid_group = True
    while invalid_group:
        group_input = get_str_input(group_list, "Research group: ")
        print(group_input)

        if group_input in group_list:
            invalid_group = False
        else:
            print('Please select a valid research group from the list above')

    sql = researchGroupRecords.format(group_input, group_input, group_input, group_input, group_input, group_input, group_input, group_input, group_input, group_input)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no record froms the research group '{}'.".format(group_input))
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records from a specific institution
def read_institutions():
    institutions = execute_sql('SELECT * FROM institution')
    print('Institutions: ')
    institution_list = []
    for row in institutions:
        institution_list.append(row['institutionCode'])
    print(institution_list)

    invalid_institution = True
    while invalid_institution:
        institution_input = get_str_input(institution_list, "Institution: ")
        print(institution_input)
        print('\n')
        if institution_input in institution_list:
            invalid_institution = False
        else:
            print('Please select a valid institution from the list above')
    
    sql = institutionRecords.format(institution_input, institution_input, institution_input, institution_input, institution_input, institution_input, institution_input, institution_input, institution_input, institution_input)

    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no records from the institution '{}'.".format(institution_input))
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records from a observer
def read_observers():
    observers = execute_sql('SELECT DISTINCT name FROM observer')
    print('Observers: ')
    observers_list = []
    for row in observers:
        observers_list.append(row['name'])
    print(observers_list)

    invalid_observer = True
    while invalid_observer:
        observer_input = get_str_input(observers_list, "Observer: ")
        print('\n')
        if observer_input in observers_list:
            invalid_observer = False
        else:
            print('Please select a valid observer from the list above')

    sql = observerRecords.format(observer_input, observer_input, observer_input, observer_input, observer_input, observer_input, observer_input, observer_input, observer_input, observer_input)

    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no records from the observer '{}'.".format(observer_input))
    else: print(tabulate(query, headers="keys", tablefmt="simple"))
    
# Read all records starting from a specific date
def read_from_date():
    print("Read all occurrence records starting from a specific date")
    date = get_date_input()
    sql = afterDateRecords.format(date, date, date, date, date)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no records after {}.".format(date))
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records between a range of dates
def read_between_dates():
    print("Read all occurrence records between 2 dates")
    year1 = input("Begin Year (YYYY): ")
    month1 = input("Begin Month (MM): ")
    day1 = input("Begin Day (DD): ")
    date1 = year1 + "-" + month1 + "-" + day1

    year2 = input("End Year (YYYY): ")
    month2 = input("End Month (MM): ")
    day2 = input("End Day (DD): ")
    date2 = year2 + "-" + month2 + "-" + day2

    sql = betweenDatesRecords.format(date1, date2, date1, date2, date1, date2, date1, date2, date1, date2)
    
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("There are no records between {} and {}.".format(date1, date2))
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Read all records from THIS logged in user
def read_my_records(oid):
    print("All records you have posted: ")
    sql = thisUser.format(oid, oid, oid, oid, oid)
    query = execute_sql(sql)
    if (tabulate(query, headers="keys", tablefmt="simple")) == "":
        print("You have not posted any occurrence records yet.")
    else: print(tabulate(query, headers="keys", tablefmt="simple"))

# Main function which prompts the user and appropriately carries out tasks according to user input
def main():
    print('''
0: log in
1: add user''')

    options_list = [0,1]
    login_choice = get_int_input(options_list, 'Choice: ')
    if login_choice == 0:
        oid = log_in()
    else:
        add_user()
        oid = log_in()
    
    logged_in = True
    while logged_in:
        print('''
What task do you want to accomplish? \n
0: add an observation record
1: modify an observation record
2: delete an observation record
3: read an observation record
4: quit
        ''')
        options_list = [0, 1, 2, 3, 4]
        option_choice = get_int_input(options_list, 'Choice: ')
        if option_choice == 0:
            add_occurrence_record(oid)
        elif option_choice == 1:
            modify_observation_record(oid)
        elif option_choice == 2:
            delete_observation(oid)
        elif option_choice == 3:
            print('''
What records do you want to read? \n
0: Read all records of a specific class
1: Read all records of a specific phylum
2: Read all records of a specific order
3: read all records of a specific family
4: read all records of a specific species
5: read all records from a specific country
6: read all records from a specific research group
7: read all records from a specific institution
8: read all records from a observer
9: read all records beginning from a specific date
10: read all records between a range of dates
11: read all records from this user
12: quit
        ''')
            options_list = []
            for i in range(0, 13):
                options_list.append(i)
            option_choice = get_int_input(options_list, 'Choice: ')
            if option_choice == 0:
                read_class()
            elif option_choice == 1:
                read_phylum()
            elif option_choice == 2:
                read_order()
            elif option_choice == 3:
                read_family()
            elif option_choice == 4:
                read_species()
            elif option_choice == 5: 
                read_country()
            elif option_choice == 6:
                read_research_group()
            elif option_choice == 7:
                read_institutions()
            elif option_choice == 8:
                read_observers()
            elif option_choice == 9:
                read_from_date()
            elif option_choice == 10:
                read_between_dates()
            elif option_choice == 11:
                read_my_records(oid)
            else: logged_in = False
        else: logged_in = False


if __name__ == '__main__':
    main()