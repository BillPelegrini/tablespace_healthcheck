# TableSpace Health Check Script

## Overview
This script is designed to assess the health of tablespaces in an Oracle database by identifying those with usage exceeding a specified target percentage. It calculates the additional space required to maintain the desired percentage of free space and provides a summary of tablespaces that need attention.

## Prerequisites
Before executing the script, ensure the following:

* Oracle Database is installed and running.
* You have the necessary privileges to run the script, including SELECT privileges on relevant database views.

## Script Parameters
* **v_target_percentage:** The desired percentage of free space in tablespaces (default is 95%).

## Usage
1. Open an Oracle SQL*Plus or SQLcl session.
2. Set the server output on with the following command:
```sql
SET SERVEROUTPUT ON
```
3. Copy and paste the script into the SQL*Plus or SQLcl session.
4. Execute the script.

## Script Logic

The script performs the following steps:

1. Retrieves the name of the Oracle database instance.
2. Iterates through all tablespaces in the database.
3. Calculates the current size, free space, and additional space required for tablespaces exceeding the target percentage.
4. Outputs a message for each identified tablespace that requires additional space.

## Example Output
```plaintext
A tablespace [INSTANCE_NAME].[TABLESPACE_NAME] needs [ADDITIONAL_SPACE] GB additional to maintain [TARGET_PERCENTAGE]% of usage.
```
## Customization
* Adjust the **v_target_percentage** variable to set your desired target percentage of free space.
* Replace **[INSTANCE_NAME]** with the actual name of your database instance.

## Note
* It is recommended to review and adjust the script to fit your specific database environment and requirements.
Disclaimer
* This script is provided as-is without any warranties. Use it at your own risk, and ensure you have adequate backups before making any changes based on the script's recommendations.
