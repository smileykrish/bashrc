#!/bin/sh
########################
# Constants
########################

PERSISTDB="$BASH_CONFIG/.persistDB"

persistDB_return=""

CMD_REPOS=1
CMD_BUILD=2
CMD_LINUX_CMD=3

########################
# Private Functions
########################

# print to stderr, red color
echo_err() {
  echo -e "\e[01;31m$@\e[0m" >&2
}

# Usage: echo_err_box <err-msg> <function-name>
echo_err_box() {
  echo_err "  +-------------------------------+"
  echo_err "  | ERROR: $1"
  echo_err "  | function: $2"
  echo_err "  +-------------------------------+"
}

########################
# Public Functions
########################

# Usage: persistDB_get <key>
persistDB_get() {
  key="$1"

  test -f "$PERSISTDB" || touch "$PERSISTDB"

  pattern="^$key\s"
  result=`grep $pattern $PERSISTDB`
  persistDB_return=$result

  [ "$result" != "" ]
}

# Usage: persistDB_add <key> [value]
persistDB_add() {
  key="$1"
  value="$2"

  test -f "$PERSISTDB" || touch "$PERSISTDB"

  echo "$key $value" > "$PERSISTDB"
}

# Usage: persistDB_del <key>
persistDB_del() {
  key="$1"

  test -f "$PERSISTDB" || touch "$PERSISTDB"

  pattern="^$key "
  sed  -ei "/$pattern/d" $PERSISTDB
}

# list all key/value pairs to stdout
# Usage: persistDB_list
persistDB_list() {
  while read line; do
    [ -z "$line" ] && continue
    array=( $line )
    echo ${array[@]}
  done < $PERSISTDB
}

# clear all key/value pairs in database
# Usage: persistDB_clear
persistDB_clear() {
  rm -rf "$PERSISTDB"
}
