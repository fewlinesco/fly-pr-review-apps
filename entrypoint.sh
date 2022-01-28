#!/bin/sh -l

if [ -n "$INPUT_PATH" ]; then
  PREV_PATH=$(pwd)
  # Allow user to change directories in which to run Fly commands
  cd "$INPUT_PATH" || exit
fi

PR_NUMBER=$(echo "$GITHUB_REF" | awk 'BEGIN { FS = "/" } ; { print $3 }')

echo "PR_NUMBER: $PR_NUMBER"
echo "app: $INPUT_NAME-pr$PR_NUMBER"

env

pwd

echo workflow
ls -la /github/workflow

echo file_commands
ls -la /github/file_commands

echo home
ls -la /github/home

ACTUAL_EXIT="$?"

if [ -n "$PREV_PATH" ]; then
  # If we changed directories before, we should go back to where we were.
  cd "$PREV_PATH" || exit
fi

exit $ACTUAL_EXIT
