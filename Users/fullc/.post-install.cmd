

choco feature enable -n=allowGlobalConfirmation
choco install adobereader -y
choco install anki -y
choco install authy-desktop -y
choco install discord -y
choco install dropbox -y
choco install pomodoneapp -y
choco install steam -y
choco install vlc -y
choco install vscode -y
choco install zoom -y

REM Powerline fonts
Set-ExecutionPolicy Bypass
git clone https://github.com/powerline/fonts.git --depth=1

REM Printer driver
wget https://gdlp01.c-wss.com/gds/2/0100004462/04/MF4700MFDriversV2090W64usEN.exe
.\MF4700MFDriversV2090W64usEN.exe
