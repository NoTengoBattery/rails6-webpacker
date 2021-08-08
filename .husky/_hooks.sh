#!/bin/sh

export GIT_FILES=$(git diff --diff-filter=d --cached --name-only)

_fail() {
  ECODE=$?
  printf "~~> $MY_NAME: $NAME: aborting...\n"
  exit $ECODE
}

run_hook() {
  eval local count=\$${FOR}_COUNT
  eval local files=\$$FOR
  [ "0$count" -eq 0 ] && return 0

  printf "~~> $MY_NAME: $FOR: $count files to check\n"
  printf "~~> $MY_NAME: $FOR: running hook...\n"
  { printf "$files" | xargs "$@"; } || _fail
  printf "~~> $MY_NAME: $FOR: hook executed successfully\n"
}

add_file() {
  local file="\\\"$1\\\""
  local variable="$2"
  local count="${2}_COUNT"
  eval eval export $variable=\\\"\$file\\\\n\\$\$variable\\\"
  eval export $count=$(($count+1))
}
