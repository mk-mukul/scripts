#! /usr/bin/bash

# &&    -> run second command if first command excuted
# ||    -> run second command if first command fails
# ;     -> run second independent of first command
# &     -> run both command at same time

EDITOR=vim

# if [ "$EDITOR" = "" ]; then
#         EDITOR=nano
# fi
# echo $EDITOR

# if [ -z "$EDITOR" ]; then
#         EDITOR=nano
# fi
# echo $EDITOR

[ -z "$EDITOR" ] && EDITOR=nano
echo $EDITOR


