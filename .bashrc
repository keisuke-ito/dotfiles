##### Setting prompt #####
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# PS1='\[\e[1;35m\]\u@\h\[\e[0m\]\[\e[32m\]:\[\e[0m\]\[\e[33m\]\w\[\e[0m\]\[\e[32m\]\$ >>\[\e[0m\] '
# for bash version 3
# export PS1='\[\e[1;35m\]\u\[\e[0m\]\[\e[32m\]:\[\e[0m\]\[\e[33m\]\w\[\e[0m\]\[\033[36m\]$(__git_ps1)\n\[\033[00m\]\[\e[32m\]\$\[\e[0m\] '
# for bash version 4,5
function _emoji(){
  echo -e '\U1F449'
}
export PS1='\[\e[1;35m\]\h\[\e[0m\]\[\e[32m\]:\[\e[0m\]\[\e[33m\]\w\[\e[0m\]\[\033[36m\]$(__git_ps1)\[\033[00m\]\n\[\e[32m\]\$\[\e[0m\] $(_emoji) '

# 出力の後に改行を入れる
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

##### alias #####
alias ls='ls -aF'
alias ll='ls -l'
alias cdtuba='cd ~/vs_code/Programming/ptj/tsubacle_server'
alias cdvp='cd ~/vs_code/Programming/Python/django/'

# alias for Python
alias python='python3'
alias pip='pip3'
alias vp='source ~/Documents/Bash/vpython.sh'

# flask
alias aflask='source ~/Documents/Bash/aflask.sh'

# Others
alias matlab='/Applications/MATLAB_R2018b.app/bin/matlab -nojvm -nodisplay -nosplash'

