add_to_path() {
  atp_path="$1"
  atp_dir="$2"

  if [[ -z "$atp_path" ]]; then
    echo "$atp_dir"
  elif [[ "$atp_path" =~ "$atp_dir" ]]; then
    echo "$atp_path"
  else
    echo "$atp_dir:$atp_path"
  fi

  unset atp_path
  unset atp_dir
}

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

if [ -d "/opt/homebrew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
  export PATH=$(add_to_path "$PATH" "$PYENV_ROOT/bin")
  eval "$(pyenv init -)"
  export PIP_REQUIRE_VIRTUALENV=true
  PATH=$(add_to_path "$PATH" "$HOME/.local/bin")
fi

# Ruby
# if [ -d "/usr/local/opt/ruby/bin" ]; then
#   PATH=$(add_to_path "$PATH" "/usr/local/opt/ruby/bin")
#   PATH=$(add_to_path "$PATH" `gem environment gemdir`/bin)
# fi

# Scala
# SCALA_PATH="$HOME/Library/Application Support/Coursier"
# if [[ -n "$SCALA_PATH" && -d "$SCALA_PATH/bin" ]]; then
#   PATH=$(add_to_path "$PATH" "$SCALA_PATH/bin")
# fi

# Java
# JAVA_PATH="/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home"
# if [[ -n "$JAVA_PATH" && -d "$JAVA_PATH" ]]; then
#   export JAVA_HOME=$JAVA_PATH
# fi

# personal bin
if [ -d "$HOME/.bin" ]; then
  PATH=$(add_to_path "$PATH" "$HOME/.bin")
fi

export PATH

# Run local env commands if they exist
if [ -f ~/.env.local ]; then
    source ~/.env.local
fi
