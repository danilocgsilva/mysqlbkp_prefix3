# README DOCS

Design document to help script development

## What is needed?

### Scenario 1

* mysql login-path
* database name
* database prefix
* say if going to save locally or just output. This variable is optional. If nothing is given, just outputs the results. If something is given, the script will assume that it is a real and writable system path to where the script will put eac prefixed table.

### Scenario 2

* database user
* database password
* database host
* database name
* database prefix
* say if going to save locally or just output. This variable is optional. If nothing is given, the just output the results. If something is given, the script will assume that it is a real and writable system path to where the script will put eac prefixed table.

The script will control the scenario by the number of provided variables. There are lots of values to be provided inline and in such situations would be better te make a little wizard to asks variable by variable. But for this, there are already the project https://github.com/danilocgsilva/mysqlbkp_prefix2. Providing the variables inline is more suitable to integrate with others script and is exactly this necessity that motivated this script.

## Steps to take:

1. Checks for variables number
2. Validates the variables provides
3. Makes the backup

## Methods

* Check if mysql is locally installed
* Check if --login-path is available in the system
* Check if the database address is acessible or is available
* Check if the database exists
* Check if a path exists
* Check if a path is writable
* Return error message with instructions if wrong number of variables is provided
* Validates the number of given variables.
* Returns a message to say how to provides valid argument amounts.
