default_branch() {
  echo $(git symbolic-ref refs/remotes/origin/HEAD | cut -d/ -f4)
}

alias cdgit="cd ~/Documents/Boulot/DfE/git"
alias cdani='cd ~/Documents/Dev/animalz && rvm gemset use animalz'
alias main="git checkout \$(default_branch)"

alias gp='git pull'
alias gl="git log \$(default_branch).. --oneline"
alias total_size='find . -depth 1 -exec du -ks {} \; | sort -n'
alias jwt_decode="jq -R 'split(\".\") | .[1] | @base64d | fromjson'"

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '+'
zstyle :compinstall filename '/Users/colinsaliceti/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '✚'
zstyle ':vcs_info:git:*' unstagedstr '●'
zstyle ':vcs_info:git*' formats "%F{blue}:%b%u%c%f"
zstyle ':vcs_info:*' actionformats '%F{cyan}:%b%u%c[%a]%f'

precmd() {
    vcs_info
}
dark_grey=240
light_grey=250
PROMPT='%(?..%F{red}%?%f )%F{$dark_grey}%n@%m:%1~%f${vcs_info_msg_0_} %F{$dark_grey}%#%f '
RPROMPT='%F{$light_grey}%*%f'

export PATH=${HOME}/go/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

bindkey \^U backward-kill-line

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
