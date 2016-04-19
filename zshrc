### Vars ###

ZSH="$HOME/.zsh"



### Shared Settings ###

# Run env commands if they exist
if [ -f ~/.env ]; then
  source ~/.env
fi

# Run alias commands if they exist
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi



### Auto Complete ###

# add a function path
fpath=($ZSH/completions /usr/local/share/zsh/site-functions $fpath)

# load and run compinit
autoload -U compinit
compinit



### Functions ###

for function in $ZSH/functions/*; do
  source $function
done



### Configs ###

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$ZSH/configs"



### Local ###

# Run local zshrc if it exists
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
