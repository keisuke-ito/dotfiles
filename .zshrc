# git設定
autoload -Uz vcs_info
setopt prompt_subst # プロンプト表示ごとに変数を展開する
zstyle ':vcs_info:git:*' check-for-changes true # リポジトリにコミットされていないファイルがあった場合にstagedstrやunsta~を設定するかどうか
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!" # ステージされていてコミットされていない(git addだけ)ファイルがあった時に表示する文字列
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+" # ステージされていなgit addされていないファイルがあった場合に表示する文字列
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b] %m%f" # $vcs_info_msg_0_で表示する内容
zstyle ':vcs_info:*' actionformats '[%b|%a] %m' # rebase 途中だったり merge でコンフリクトが発生したり、何か特別な状況になった時に formats の代わりに表示

# gitリポジトリにいる場合、set-messageフックでgit-config-user関数が呼び出されるように登録
zstyle ':vcs_info:git+set-message:*' hooks git-config-user

# "+vi-<フック名>"関数で、hook_com[misc]にgit config user.emailの結果を代入する
function +vi-git-config-user(){
  hook_com[misc]+=`git config user.email`
}

# ===================================================
# Prompt Settings
# ===================================================
# 関数でプロンプトの指定(以前の)
# function left-prompt {
#   host='%F{white}%B%m%b%f'
#   name='%F{white}%B%n%b%f' # user name text color
#   path='%F{yellow}%B%~%b%f' # path text color
#   sharp='\uE0B0' # triangle

#   colon='%F{white}%B:%b%f'

#   # echo "%K{blue} ${host}${colon}${name} %k%K{green}%F{blue}${sharp}%f ${path}%k%F{green}${sharp}%f\n$ "
#   # echo "[${host}@${name}] ${path}\n$ "

#   echo " %{\e[38;5;16;48;5;46m%}%m%(!.#.$)%{\e[m%} "
#  }
function left-prompt {
  # [30;48;5;色番号m で背景色、[38;5;色番号m で文字色を指定できる。
  host_t='015m%}'      # user name text clolr
  host_b='245m%}'    # user name background color
  name_t='015m%}'
  name_b='130m%}'
  path_t='255m%}'     # path text clolr
  path_b='031m%}'   # path background color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp='\uE0B0'      # triangle

  host="${back_color}${host_b}${text_color}${host_t}"
  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${host} %m ${back_color}${name_b}${text_color}${host_b}${sharp}${reset}${user} %n ${back_color}${path_b}${text_color}${name_b}${sharp}${reset}${dir} %~ ${reset}${text_color}${path_b}${sharp}${reset}\n$ "
}

# main
PROMPT=`left-prompt`

# right
RPROMPT=''\$vcs_info_msg_0_''

# 出力の後に改行を入れる
# precmdはコマンド実行後に自動的に実行される関数
function precmd() {
  vcs_info
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
	NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
	printf '\n'
  fi
}

# ===================================================
# Option Settings
# ===================================================
# 重複を記録しない
setopt hist_ignore_dups

# ===================================================
# PATH Settings
# ===================================================
export PATH=/usr/local/bin:$PATH # brew
export PATH="$PATH:/Users/itokeisuke/Work/src/flutter/bin" # flutter
export PATH="/usr/local/opt/postgresql@13/bin:$PATH" # PostgreSQL

# VARIABLES
export PGDATA="/usr/local/var/postgres"

# ===================================================
# Alias Settings
# ===================================================
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -aGF'
alias ll='ls -l'
alias vimz='vim ~/.zshrc'
alias sourcezsh='source ~/.zshrc'
alias python='python3'
alias pip='pip3'
alias matlab='/Applications/MATLAB_R2020b.app/bin/matlab -nojvm -nodisplay -nosplash'
alias cbash='cd ~/Work/Private/bash/'
