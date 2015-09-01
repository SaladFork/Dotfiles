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

compdef _ember ember
