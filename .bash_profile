### オリジナルのPATH
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

### オリジナルに設定されているPATH
# export PATH=$PATH:/Library/TeX/texbin # TeX
# export PATH=$PATH:/Applications/Wireshark.app/Contents/MacOS # Wireshark

### .bashrc ###
#.bashrcがあれば.bashrcを読み込む
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

### add path ###

# Flutter
export PATH="/Users/itoukeisuke/development/flutter/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


### color ###
export GREP_OPTIONS='--color=always'


### ProgreSQL ###
export PATH="/usr/local/opt/postresql@12/bin:$PATH"
export PGDATA=/usr/local/var/postgres
