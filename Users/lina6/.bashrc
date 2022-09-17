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


# GIT START

function configpush() {
	config add -u
	if [ -z "$1" ] ; then
		config commit -m "$(date)"
	else
  		config commit -m $1
	fi
	config pull
	config push
}
alias pushconfig="configpush"

function pushnotes() {
	cd ~/learning/notes;
	git add -A
	if [ -z "$1" ] ; then
		git commit -m "$(date)"
	else
  		git commit -m $1
	fi
	git pull;
	git push;
}

# git sparse checkout
# I use this when setting up my config dotfiles
# so I only have the files that I want in the git repo
# instead of all of the files in my home directory
# TODO: what is sparse checkout?
function sparse-checkout() {
	if [ -z "$1" ] ; then
		echo 'Usage: sparse-checkout <url>'
		return
	fi

	giturl="$1"
	filename=$(basename "$giturl")
	filename="${filename%.*}"

	mkdir $filename
	cd $filename
	git init
	git remote add -f origin $giturl
	git config core.sparseCheckout true

	echo "\n"
	echo "Add the directories you wish to pull\n"
	echo '    echo "some/dir/" >> .git/info/sparse-checkout\n'
	echo "\n"
	echo 'When you are done, pull\n'
	echo '    git pull origin main\n'
}

# -- tells shell to treat any future dashes like strings and not flags
undo-rm() {
	filePath="$1"
	git reset -- $1
	git checkout -- $1
}

createpr() {
	git stash;
	git switch -c $1;
	git commit --allow-empty --no-verify -m "Trigger GH Actions";
	git push origin $1 --no-verify;
	git set-upstream;
	# using `--web` instead of `--draft` so that the PR description isn't blank and uses the PR template
	gh pr create --assignee "@me" --web;
	git stash pop;
}

pushempty() {
	git commit --allow-empty -m "Trigger GH Actions";
	git push;
}
emptycommit="pushempty"

bumpversion() {
	npm version patch --no-git-tag-version;
	git add package.json package-lock.json;
	git commit --no-verify -m "Bump version";
	git push --no-verify;
}

push-staged() {
	git commit --no-verify -m "$1";
	git push --no-verify;
}

push() {
	git add -u
	push-staged $1
}

pushall() {
	git add -A
	push-staged $1
}

commitconfig() {
	config commit -m $1
	config push
}

# https://www.youtube.com/watch?v=lZehYwOfJAs
recent-branch() {
	git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always" | xargs git checkout
}

alias rb=recent-branch

# GIT END


# File and folder helpers START

mkcd () {
  mkdir "$1"
  cd "$1"
}

function diffdir() {
	diff -r $1 $2 | grep $1 | awk '{print $4}'
}

function t() {
	# Defaults to 3 levels deep, do more with `t 5` or `t 1`
  	# pass additional args after
	tree -I '.git|node_modules|.DS_Store' --dirsfirst -L ${1:-3} -aC $2
}

# asdf/fileName.ext => fileName
function extract-filename() {
	fullfile="$1"
	filename=$(basename "$fullfile")  # asdf/fileName.ext => fileName.ext
	echo "${filename%.*}"  # fileName.ext => fileName
}

# File and folder helpers END

# File Manipulation/editing START

function mp4slice() {
	ffmpeg -ss "$2" -i "$1" -t "$3" -vcodec copy -acodec copy splice.mp4
}

function mp3slice() {
    if [ -z "$1" ] ; then
        echo 'Usage: mp3slice mp3File timeStart timeDuration'
        return
    fi
    ffmpeg -ss "$2" -i "$1" -t "$3" -c copy output.mp3
}

# Just use handbrake
compressmp4() {
	if [ -z "$1" ] ; then
		echo 'Usage: compressmp4 "file_path"'
		return
	fi
	ffmpeg -i "$1" -acodec mp2 "compressed-$1"
}

function compressmp4folder() {
	for file in "$PWD"/*; do
		ffmpeg -i "$file" -acodec mp2 "${file/.mp4/s.mp4}"
	done
}



function md2word() {
	if [ -z "$1" ] ; then
		echo 'Usage: md2word src dest'
		return
	fi
	pandoc -o "$2" -f markdown -t docx "$1"
}

function shrinkimage() {
	if [ -z "$1" ] ; then
		echo 'Usage: shrinkimage src dest size'
		return
	fi
	convert "$1" -resize x"$3" "$2"
}

# requires ghostscript
# usage: compresspdf <pdf filename>
function compresspdf() {
	if [ -z "$1" ] ; then
	        echo 'Usage: compresspdf <pdf filename>'
        	return
   	fi
    /usr/local/bin/gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

function compressresume() {
	rm -f ~/learning/portfolio/public/assets/Fullchee-Resume.pdf;
	compresspdf ~/Dropbox/apps/Fullchee-Resume.pdf ~/learning/portfolio/public/assets/Fullchee-Resume.pdf;
}

function youtubemp3() {
	if [ -z "$1" ] ; then
		echo 'Usage: youtubemp3 <url>'
		return
	fi
	yt-dlp --extract-audio --audio-format mp3 $1
}
alias youtubewebm=yt-dlp
alias youtubemp4=yt-dlp

function mp3tomp4() {
    if [ -z "$1" ] ; then
        echo 'Usage: mp3tomp4 mp3File imgFile'
        return
    fi
    ffmpeg -loop 1 -i "$2" -i "$1" -c:a copy -c:v libx264 -shortest out.mp4
}

# adds a dropshadown to an image
function dropshadow () {
	if [ -z "$1" ] ; then
        echo 'Usage: dropshadow filename'
        return
    fi

    filename=$(basename -- "$1")
    # extension="${filename##*.}"
    basename="${filename%.*}"
    # we want to enforce png (even if .jpg as input)
    suffix=".png"
    convert "$1" \( +clone -background black -shadow 50x10+5+5 \) +swap -background none -layers merge +repage "$basename$suffix"
}

function searchbranches() {
	if [ -z "$1" ] ; then
        echo 'Usage: search-branches searchTerm'
        return
    fi
	git grep "$1" `git show-ref --heads`
}

function delete_current_branch() {
	branch_name=`git rev-parse --abbrev-ref HEAD`;
	git stash;
	git checkout main;
	git branch -D $branch_name;
	git pull;
	git stash pop;
}

# File Manipulation/editing END

killport() {
    if [ -z "$1" ] ; then
        echo 'Usage: killport <portnumber'
        return
    fi
    kill $(lsof -t -i:"$1")
}

# start vim at the end of the file
vimend () {
    vim '+normal Go' $1
}

debugnode () {
	if [ -z "$1" ] ; then
		echo 'usage: debugnode <path to node file>'
		return
	fi
    node --inspect-brk=9229 "$1" 28688 1
}
# usage: resetmongo <backupdb> <maindb>
function resetmongo() {
    if [ -z "$1" ] || [  -z "$2" ] ; then
        echo 'Usage: resetmongo <backupdb> <maindb>'
        return
    fi

    backupdb="$1"
    maindb="$2"

    mongo "$maindb" --eval "db.dropDatabase()"
    mongo "$backupdb" --eval "db.copyDatabase(\"$backupdb\", \"$maindb\")"
}

function restoredb() {
	if [ -z "$1" ] ; then
		echo 'Usage: restoredb <db name>'
		return
	fi
    mongo "$1" --eval "db.dropDatabase()";
    mongo --eval "db.copyDatabase('$1-cp', '$1')";
}

function notify() {
	if [ -z "$1" ] ; then
		echo 'Usage: notify <message> time'
		return
	fi
	echo 'notify-send "$1"' | at $2
}

function killfreedom() {
	sudo kill "$1" "$2" "$3" && sleep 1800 && open -a 'Freedom'
}

generate-psql-url() {
	echo "postgresql://$REMOTE_DATABASE_USER:$REMOTE_DATABASE_PASSWORD@localhost:$LOCAL_DATABASE_PORT/$REMOTE_DATABASE_NAME"
}

lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}


