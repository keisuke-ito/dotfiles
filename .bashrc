##### Setting prompt #####
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

# ===================================================
# Prompt Settings
# ===================================================
# PS1='\[\e[1;35m\]\u@\h\[\e[0m\]\[\e[32m\]:\[\e[0m\]\[\e[33m\]\w\[\e[0m\]\[\e[32m\]\$ >>\[\e[0m\] '
# for bash version 3
# export PS1='\[\e[1;35m\]\u\[\e[0m\]\[\e[32m\]:\[\e[0m\]\[\e[33m\]\w\[\e[0m\]\[\033[36m\]$(__git_ps1)\n\[\033[00m\]\[\e[32m\]\$\[\e[0m\] '
# for bash version 4,5
function _emoji(){
  echo -e '\U1F449'
}
# triangle: 
# export PS1='\[\e[1;35m\]\h\[\e[0m\]\[\e[32m\]:\[\e[0m\]\[\e[33m\]\w\[\e[0m\]\[\033[36m\]$(__git_ps1)\[\033[00m\]\n\[\e[32m\]\$\[\e[0m\] $(_emoji) '
# export PS1='\[\e[1;30;44m\] \h \[\e[0m\]\[\e[1;34;42m\]\[\e[0m\]\[\e[30;42m\] \u \[\e[0m\]\[\e[32;46m\]\[\e[0m\]\[\e[30;46m\] \w \[\e[0m\]\[\e[36m\]\[\e0m\]\[\033[36m\]$(__git_ps1)\[\033[00m\]\n\[\e[32m\]\$\[\e[0m\] '

function left-prompt {
  # [30;48;5;色番号m で背景色、[38;5;色番号m で文字色を指定できる。
  host_t='234m\]'      # user name text clolr
  host_b='248m\]'    # user name background color
  name_t='234m\]'
  name_b='025m\]'
  path_t='234m\]'     # path text clolr
  path_b='220m\]'   # path background color
  text_color='\[\e[38;5;'    # set text color
  back_color='\[\e[30;48;5;' # set background color
  reset='\[\e[0m\]'   # reset
  sharp=''      # triangle

  host="${back_color}${host_b}${text_color}${host_t}"
  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${host} \h ${back_color}${name_b}${text_color}${host_b}${sharp}${reset}${user} \u ${back_color}${path_b}${text_color}${name_b}${sharp}${reset}${dir} \w ${reset}${text_color}${path_b}${sharp}${reset}\[\033[36m\]\$(__git_ps1)\[\033[00m\]\n$ "
}
export PS1=`left-prompt`

# 出力の後に改行を入れる
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'


# ===================================================
# Alias Settings
# ===================================================
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -aFG'
alias ll='ls -l'
alias vimb='vim ~/.bashrc'
alias vimbp='vim ~/.bash_profile'
alias sourceb='source ~/.bashrc'
alias sourcebp='source ~/.bash_profile'
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


