#!/bin/bash

commands=(
"$DART_HOME/pub run build_runner build"
"$FLUTTER_HOME/flutter packages pub run build_runner build --delete-conflicting-outputs"
"$FLUTTER_HOME/flutter packages pub run build_runner watch"
"pub global run intl_utils:generate"
"iconfont_builder --from ./fonts --to ./lib/iconfont.dart --focus true"
"agen -w --no-watch -s --no-save -c RandomRes"
)

echo Your DART_HOME: $DART_HOME
echo Your FLUTTER_HOME: $FLUTTER_HOME
echo
echo Please select a command.
echo ==============================
for i in "${!commands[@]}"
do
  echo "$i) ${commands[i]}"
done
echo ==============================
echo

read -p "Enter command id:" command_id
${commands[command_id]}