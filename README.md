# Windows Dotfiles

## Setup

1. Login to GitHub
2. Install Chocolatey
3. Install cmder
4. Clone this repo

Using `&&` because it gets copy/pasted as one line in cmder

```cmd
DOSKEY config=C:\tools\Cmder\vendor\git-for-windows\bin\git --git-dir=C:/.cfg/ --work-tree=C:/ $* &&
C:\tools\Cmder\vendor\git-for-windows\bin\git init --bare C:/.cfg &&
config config --local status.showUntrackedFiles no &&
config remote add origin git@github.com:Fullchee/windows-dotfiles.git &&
config fetch &&
config reset --hard origin/main &&
config branch --set-upstream-to=origin/main main
```

5. Run `post-install.sh`


## Manual Steps

- [Firefox: compact mode](https://support.mozilla.org/en-US/kb/compact-mode-workaround-firefox)
- download Centered from the Windows store
