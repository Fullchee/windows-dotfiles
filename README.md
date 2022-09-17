# windows-dotfiles

1. Login to GitHub
2. Install Chocolatey
3. Install cmder
4. Clone this repo

```bash
git init --bare $HOME/.cfg
config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config remote add origin git@github.com:Fullchee/mac-dotfiles.git
config fetch origin master
config reset --hard origin/master
config branch --set-upstream-to=origin/master master
zsh ~/.post-install.sh
```

5. Run `post-install.sh`

- [Firefox: compact mode](https://support.mozilla.org/en-US/kb/compact-mode-workaround-firefox)
- download Centered from the Windows store
