;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat -n "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
config=git --git-dir=C:\.cfg --work-tree=C:\ $*
o.=start .
lazygit=git commit -m "$*" && git pull && git push
lazyconfig=git --git-dir=C:\.cfg --work-tree=C:\ commit -m "$*" && git --git-dir=C:\.cfg --work-tree=C:\ pull && git --git-dir=C:\.cfg --work-tree=C:\ push
vsc=code
delete_current_branch=for /f "usebackq tokens=*" %a in (`git rev-parse --abbrev-ref HEAD`) do git checkout master && git branch -D %a && git pull
