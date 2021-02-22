REM RUN ON AN ADMIN CMD
rem install choco first
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco feature enable -n=allowGlobalConfirmation

choco install 7zip ^
cmder ^
f.lux ^
git.install ^
googlechrome ^
googledrive ^
keepass.install ^
nodejs-lts ^
paint.net ^
pip ^
procexp ^
python ^
sharex ^
sublimetext3 ^
vscode ^
youtube-dl

npm install -g npm \
eslint \
eslint-config-airbnb \
eslint-plugin-import \
eslint-plugin-jsx-a11y \
eslint-plugin-react \
eslint-plugin-react-hooks\
jest \
tldr \
write-good

# install my dotfiles after installing cmder (and git!)
git clone --bare https://github.com/Fullchee/windows-dotfiles.git C:\.cfg
alias config=git --git-dir=C:\.cfg --work-tree=C:\ $*
config config --local status.showUntrackedFiles no
config reset --hard

setx /M PATH "%PATH%;C:\Program Files (x86)\Notepad++"
