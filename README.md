# AI-UN-SDG5_Data_Preparation

This repository contains a Jupyter notebook called data_preparation.ipynb that generates csv files for the [AI-UN-SDG5](https://github.com/AI-UN-SDG5/AI-UN-SDG5-App) application and database to be functional.

## Instructions to Execute the Jupyter Notebook and Generate the CSV Files
1. Ensure that [git](https://git-scm.com/downloads) is installed on your device.
2. Ensure that [python 3](https://www.python.org/downloads/) is installed on your device.
3. Clone this git repository on your local device at a safe directory with the command ```git clone https://github.com/AI-UN-SDG5/AI-UN-SDG5_Data_Preparation```
4. Enter the repository with the command ```cd AI-UN-SDG5_Data_Preparation```
5. Create a file called .env and add in this file a variable called DATA_PATH that stores a path on your local device where csv files should be saved. See the .env.example file for guidance.
6. Make the bash script executable with the command ```chmod 744 bash.sh```
7. Jupyter notebook should be opened in your browser where you can run all cells and have the csv files generated at the specified data path.