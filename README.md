# CS3200: Database Design Final Project - Creature Spottings

👩‍💻 &emsp;Florenz Blancaflor, Taylor Hsu, Jaana Tabalon
<br>
👥 &emsp;Group Name: TabalonJBlancaflorFHsuT
<br>
🗓️ &emsp;Spring '22
<br>

<h1>Summary</h1>
Our project was built to allow users to record, modify, and read occurrence records of certain flora and fauna found in the world. This project is meant to act as a management and analysis interface with which users can use to record and search specific creatures and track their appearances in certain areas. 
<br><br>
We scraped the Global Biodiversity Information Facility (GBIF) web browser, which contains free and open access biodiversity data, to find real-life data about creatures, namely frogs, fish, trees, mushrooms, and flowers, found throughout the Philippines. These data records were used to populate the tables in our database.
<br>
🐸 &ensp;🐠 &ensp;🍄&ensp;🌺&ensp;🌳
<br>

<h1>Technology Specifications</h1>
We utilized SQL queries and Python as the host language in which the SQL queries were embedded into. We connected the SQL database to Python using the PyMySQL client library. <br><br>
Below are the technogical aspects necessary to run and interact with this application: <br>
<ol>
    <li>MySQL Workbench (<a href="https://dev.mysql.com/downloads/workbench/">Installation link</a>)</li>
    <li>Command-line interface</li>
    <li>Python (<a href="https://www.python.org/downloads/">Installation link</a>)</li>
    <li>PyMySQL (<a href="https://pypi.org/project/PyMySQL/#installation">Installation link</a>)</li>
    <li>Tabulate (<a href="https://pypi.org/project/tabulate/">Installation link</a>)</li>
</ol>
<br>

<h1>In this repo</h1>
<ul>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/tree/main/creature%20data"><code>/creature data</code></a>: Folder containing all of the CSV files scraped from the GBIF web browser used to populate our tables</li>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/tree/main/sql"><code>/sql</code></a>: Folder containing all of the SQL files created for this project including:</li>
        <ul>
            <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/sql/creatureSpottingsDB.sql"><code>creatureSpottingsDB.sql</code></a>: SQL file to create all normalized tables in the database</li>
            <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/sql/creatureSpottingsDump.sql"><code>creatureSpottingsDump.sql</code></a>: SQL file to create the entire database, including all table data, all at once</li>
            <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/sql/procs_triggers.sql"><code>procs_triggers.sql</code></a>: SQL file to create all necessary procedures and triggers</li>
        </ul>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/CS3200%2BFinalProjectDemoVideo.mp4"><code>CS3200+FinalProjectDemoVideo.mp4</code></a>: Video to explain and demo our project</li>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/CS3200creature_spottings.py"><code>CS3200creature_spottings.py</code></a>: The executable Python program that connects to the creature_spottings database and used to interact with the database</li>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/sqlVar.py"><code>sqlVar.py</code></a>: Python file to hold variables of SQL calls made in our code</li>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/README.md"><code>README.md</code></a>: This file!</li>
</ul>
<br>

<h1>Using This Project</h1>
<h2>Download the repo</h2>
<ol>
    <li>Clone this repo onto your personal machine or download a ZIP file. If needed, unzip the ZIP file. </li>
    <li>Save the repo to an easily findable location, like <code>/Desktop</code>, <code>/Documents</code>, or some other folder.</li>
</ol>

<h2>Load the DB dump</h2>
<ol>
    <li>Open the file <code>creatureSpottingsDump.sql</code> in MySQL Workbench. (Download MySQL Workbench <a href="https://dev.mysql.com/downloads/workbench/">here</a>.)</li>
    <li>Run the entirety of the file to ensure you have all of the necessary tables, procedures, triggers, functions, and data to interact with this project.</li>
</ol>

<h2>Interacting</h2>
<ol>
    <li>Open your machine's command-line interface (Terminal on Mac, Command Line on Windows, etc.).</li>
    <li>Navigate to where you saved the copy of this repo. (i.e. <code>cd Documents/CS3200-FINAL-PROJECT</code>)</li>
    <li>To run this application, you will need the following installed on your machine: Python (at least v3.7), <a href="https://pypi.org/project/PyMySQL/">PyMySql</a>, and <a  href="https://pypi.org/project/tabulate/">Tabulate</a>.
    <br>
    Download Python <a href="https://www.python.org/downloads/">here</a>.
    <br>
    Download PyMySql by running <code>pip install PyMySQL</code> in your command line interface.
    <br>
    Download Tabulate by running <code>pip install tabulate</code> in your command line interface.</li>
    <li>To begin using this application, type <code>python CS3200creature_spottings.py</code> into the command line interface and begin interacting by following the given prompts. If successful, you should see a prompt requesting you to enter your DB credentials.</li>
</ol>
<br>

<h1>Helpful Links</h1>
<ul>
    <li><a href="https://docs.google.com/document/d/1iyNG2t4s5Hf73U3ktlM_kfVg9TzZ7nm5hzp9Rq7EXEA/edit?usp=sharing">Project proposal</a></li>
    <li><a href="https://docs.google.com/document/d/1SCU78gjwNTCGARCyiVDa-YuPHVsXkPjsdmLAWHzmhpI/edit?usp=sharing">Final project report</a></li>
    <li>Demo video</li>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/diagrams/UML.pdf">UML diagram</a></li>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/diagrams/LogicalDesign.pdf">Logical design</a></li>
    <li><a href="https://github.com/florenzkat/CS3200-Final-Project/blob/main/diagrams/UserFlow.pdf">Final user flow</a></li>
</ul>