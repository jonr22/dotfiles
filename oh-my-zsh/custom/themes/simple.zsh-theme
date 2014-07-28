ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function rvm_info_for_prompt {
  ruby_version=$(~/.rvm/bin/rvm-prompt)
  if [ -n "$ruby_version" ]; then
    echo "[$ruby_version]"
  fi
}

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

PROMPT='
%{$fg[magenta]%}%~%{$reset_color%}$(git_prompt_info)
%_$(prompt_char) '

RPROMPT=''
RPROMPT='$(virtualenv_prompt_info)%{$reset_color%}'
