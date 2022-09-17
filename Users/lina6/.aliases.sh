#!C:\tools\Cmder\vendor\git-for-windows\usr\bin\sh.exe

######## GIT START
# --- CONFIG
# use 'config' instead of 'git' to manage this git repo, lose all git auto-complete commands :(
alias config='git --git-dir=C:/.cfg/ --work-tree=C:/' $@
alias save-crontab='sudo crontab -l >| ~/.backup-crontab.sh'
alias pull='git stash && git pull && git stash pop'

alias gc="git commit --no-verify -m"
alias gs="git st"

# view GitHub PRs
alias ghpr='git ghpr'
######## GIT END

### Better defaults
alias ls='ls -GF'
alias vsc="code"
alias o.="o ."

alias viewpr="gh pr view -w"


### ??????
alias globalnpm="npm list -g --depth=0"
alias largestfiles="du -h . | sort -rh" | head -100
alias ipaddr="ifconfig | grep inet"
alias recordaudio="osascript record-audio.scpt"
alias record-audio="recordaudio"

### Shortcuts
alias sz="source ~/.bashrc"
alias cat="bat"
alias -s {js,json,env,md,html,css,toml}=cat

alias stopin30="sudo shutdown -s +30"

alias gd="gatsby develop"
alias startmongo="brew services start mongodb-community"
alias stopmongo="brew services stop mongodb-community"

alias reinstall="rm -rf package-lock.json && rm -rf node_modules && npm i"

alias killpostmaster="rm /usr/local/var/postgres/postmaster.pid"
alias fixpsql="killpostmaster"

alias rm-known-localhost="sed -i '' '/^\[localhost\]:56789/d' ~/.ssh/known_hosts"

alias randomstring="openssl rand -base64 24"

alias youtube="cd /Users/fullchee/Library/CloudStorage/GoogleDrive-fullchee@gmail.com/My\ Drive/YouTube"

