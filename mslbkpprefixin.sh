#!/bin/bash

## version
VERSION="0.0.1"

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
  echo "There\'s no a valid argument numbers"
  echo "Provides 3 arguments: {mysql client login path value} {database name} {database prefix}. Just outputs the results usign configurations stored in the --login-path. More secure, less flexible."
  echo "Provides 4 arguments: {mysql client login path value} {database name} {database prefix} {system path}. Backups the database in the given directory using configurations stored in the --login-path. More secure, less flexible."
  echo "Provides 5 arguments: {database user} {database password} {database host} {database name} {database prefix}. Just outputs the results with configurations provided inline. Less secure, more flexible."
  echo "Provides 6 arguments: {database user} {database password} {database host} {database name} {database prefix} {system path}. Backups the database in the given directory with configurations provided inline. Less secure, more flexible."
}

## Main function
mslbkpprefixin () {
  local variables_given=$#

  validates_variables_number_given
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
