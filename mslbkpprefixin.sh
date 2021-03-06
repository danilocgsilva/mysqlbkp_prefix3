#!/bin/bash

set -e

## version
VERSION="1.0.1"

##
loop_prefix_loginpath () {
  mysql --login-path=$1 $2 -e "SHOW TABLES" | grep -i "^$3"
}

##
loop_prefix_credentials () {
  mysql -u$1 -p$2 -h$3 $4 -e "SHOW TABLES" | grep -i "^$5"
}

##
# make_dump () {
#   if [ $(uname) -eq Darwin ]; then
#     mysqldump --column-statistics=0 --login-path=$1 $2 $i
#   else
#     mysqldump --login-path=$1 $2 $i
#   fi
# }

##
outputs_with_loginpath () {
  for i in $(loop_prefix_loginpath $1 $2 $3)
  do
    mysqldump --login-path=$1 $extra_prevent_statistic_errors $2 $i
  done
}

##
outputs_with_credentials () {
  for i in $(loop_prefix_credentials $1 $2 $3 $4 $5)
  do
    mysqldump $extra_prevent_statistic_errors -u$1 -p$2 -h$3 $4 $i
  done
}

##
save_with_loginpath () {
  if [ ! -d $4 ]; then
    echo The \'$4\' must be a valid path. Does not exists. Skiping $0 script.
    exit 1
  fi

  for i in $(loop_prefix_loginpath $1 $2 $3)
  do
    mysqldump --login-path=$1 $extra_prevent_statistic_errors $2 $i > $4/$i.sql
  done
}

##
save_with_credentials () {
  if [ ! -d $6 ]; then
    echo The \'$6\' must be a valid path. Does not exists. Skiping $0 script.
    exit 1
  fi

  for i in $(loop_prefix_credentials $1 $2 $3 $4 $5)
  do
    mysqldump $extra_prevent_statistic_errors -u$1 -p$2 -h$3 $4 $i > $6/$i.sql
  done 
}

##
do_backup () {
  if [ $# = 3 ]; then
    outputs_with_loginpath $1 $2 $3
  elif [ $# = 4 ]; then
    save_with_loginpath $1 $2 $3 $4
  elif [ $# = 5 ]; then
    outputs_with_credentials $1 $2 $3 $4 $5
  elif [ $# = 6 ]; then
    save_with_credentials $1 $2 $3 $4 $5 $6
  fi
}

##
validates_variables_number_given () {

  if
    [ ! $variables_given -eq 3 ] &&
    [ ! $variables_given -eq 4 ] &&
    [ ! $variables_given -eq 5 ] &&
    [ ! $variables_given -eq 6 ]
  then
    message_correct_numbers_variables
    exit
  fi
}

## Displays a message to conduct the user to put the right number of arguments
message_correct_numbers_variables () {
  echo "There's no a valid argument numbers"
  echo "You can provide:"
  echo "* 3 arguments: {mysql client login path value} {database name} {database prefix}. Just outputs the results usign configurations stored in the --login-path. More secure, less flexible."
  echo "* 4 arguments: {mysql client login path value} {database name} {database prefix} {system path}. Backups the database in the given directory using configurations stored in the --login-path. More secure, less flexible."
  echo "* 5 arguments: {database user} {database password} {database host} {database name} {database prefix}. Just outputs the results with configurations provided inline. Less secure, more flexible."
  echo "* 6 arguments: {database user} {database password} {database host} {database name} {database prefix} {system path}. Backups the database in the given directory with configurations provided inline. Less secure, more flexible."
}

## Main function
mslbkpprefixin () {
  local variables_given=$#
  validates_variables_number_given

  if [ $(uname) = Darwin ]; then
    local extra_prevent_statistic_errors='--column-statistics=0'
  fi

  do_backup "${@}"
}

## detect if being sourced and
## export if so else execute
## main function with args
if [[ /usr/local/bin/shellutil != /usr/local/bin/shellutil ]]; then
  export -f mslbkpprefixin
else
  mslbkpprefixin "${@}"
  exit 0
fi
