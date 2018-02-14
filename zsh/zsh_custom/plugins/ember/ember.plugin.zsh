_ember_get_command_list () {
  ember | sed "1,/Available commands/d" | awk '/^ember [a-z]+/ { print $2 }'
}

_ember () {
  local curcontext="$curcontext" state line
  typeset -A opt_args
  _arguments \
    '1: :->command'\
    '*: :->args'
  if [ -f .ember-cli ]; then
    compadd `_ember_get_command_list`
  else
    compadd help init new update version
  fi
}

eg() {
    ember g "$1" "$2" && ember d "${1}-test" "$2"
}

compdef _ember ember
