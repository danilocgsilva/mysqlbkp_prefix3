#!/bin/bash

## version
VERSION="0.0.1"

check_variables_number () {

}

## Main function
mslbkpprefixin () {
  echo eu recebi $# variáveis
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
