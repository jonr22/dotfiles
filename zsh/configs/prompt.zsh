# prompt
setopt multios
setopt prompt_subst

GIT_PROMPT_PREFIX=" %{$fg[green]%}"
GIT_PROMPT_SUFFIX="%{$reset_color%}"
GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
GIT_PROMPT_CLEAN=""

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  echo "$GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local GIT_STATUS=''
  GIT_STATUS=$(command git status -s --ignore-submodules=dirty 2> /dev/null | tail -n1)

  if [[ -n $GIT_STATUS ]]; then
    echo "$GIT_PROMPT_DIRTY"
  else
    echo "$GIT_PROMPT_CLEAN"
  fi
}

PROMPT='
%{$fg[magenta]%}%~%{$reset_color%}$(git_prompt_info)
%_$ '

RPROMPT=''

virtualenvwrapper='virtualenvwrapper.sh'
if (( $+commands[$virtualenvwrapper] )); then
  RPROMPT='$(virtualenv_prompt_info)%{$reset_color%}'
fi
