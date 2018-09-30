# mysqlbkp_prefix3

Makes a mysql database backup from prefixed tables with inline values.

This script was designed to be an installable shell script that will be consumed by another script.

## Install

In the terminal, go to root project root and execute `make`. You may need administration privileges to make the installation work.

## Usage

**ADVISE**: following I show for ways by which the command can be used. I recommends that just the first and second form of usage may be used. The third and fourth one are rather dangerous, becouse you need to put database credentials in scripts.

1. `mslbkpprefixin LOGIN_PATH_VALUE DATABASE_NAME DATABASE_PREFIX`: Outputs the backup script based on `login-path` mysql value. So you can redirect it to something else.
2. `mslbkpprefixin LOGIN_PATH_VALUE DATABASE_NAME DATABASE_PREFIX PHYSICAL_PATH`: Make a file for each prefixed table in `PHYSICAL_PATH`. The database informations is based on `login-path` value.
3. `mslbkpprefixin DATABASE_USER DATABASE_PASS DATABASE_HOST DATABASE_NAME DATABASE_PREFIX`: Outputs the backup script based on database credentials infos (*this can be dangerous for security credentials safety*). So you can redirect it to something else.
4. `mslbkpprefixin DATABASE_USER DATABASE_PASS DATABASE_HOST DATABASE_NAME DATABASE_PREFIX PHYSICAL_PATH`: Make a file for each prefixed table in `PHYSICAL_PATH`. The database informations is based on mysql credentials that mus be provided inline (*this can be dangerous for security credentials safety*).
