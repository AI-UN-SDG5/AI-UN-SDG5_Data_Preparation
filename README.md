# AI-UN-SDG5_Data_Preparation
This repository contains a Jupyter notebook called data_preparation.ipynb that generates csv files and a database for the AI-UN-SDG5 [app](https://github.com/AI-UN-SDG5/AI-UN-SDG5-App) and [api](https://github.com/AI-UN-SDG5/AI-UN-SDG5-GenAI-API) to be functional.

## Instructions to Execute the Jupyter Notebook and Generate the CSV Files
1. Ensure that [git](https://git-scm.com/downloads) is installed on your device.
2. Ensure that [python 3](https://www.python.org/downloads/) is installed on your device.
3. Clone this git repository on your local device at a safe directory with the command ```git clone https://github.com/AI-UN-SDG5/AI-UN-SDG5_Data_Preparation```
4. Enter the repository with the command ```cd AI-UN-SDG5_Data_Preparation```
5. Create a file called .env and add to this file a variable called DATA_PATH that stores a path on your local device where csv files should be saved. See the .env.example file for guidance.
6. Make the bash script executable with the command ```chmod 744 bash.sh```
7. Execute the jupyter notebook with the command ```./bash.sh``` which will generate the csv files at the specified data path.
8. Now that the config data is ready, download [pgAdmin](https://www.pgadmin.org/) and generate a database with the requisite credentials (host, username, password, database name, port).
9. Download a database driver such as [DBeaver](https://dbeaver.io/) to connect to the database with the credentials created in the previous step.
10. Open the SQL editor, copy and paste the contents from db.sql, then run execute. The tables should be created with their relations.
11. Import the config csv files generated at the specified path into the relevant tables.
    - country.csv > country
    - calling_code.csv > calling code
    - sex.csv > sex
    - blood_type.csv > blood_type
    - skin_type.csv > skin_type
    - diet.csv > diet