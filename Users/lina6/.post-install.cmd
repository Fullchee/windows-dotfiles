choco feature enable -n=allowGlobalConfirmation
choco install adobereader -y
choco install anki -y
@REM choco install cmder -y
choco install discord -y

REM for youtube-dl
choco install ffmpeg -y
choco install git -y
choco install pomodoneapp -y
choco install steam -y
choco install vlc -y
choco install vscode -y
choco install wget -y
choco install yt-dlp -y
choco install zettlr -y
choco install zoom -y

REM Powerline fonts
Set-ExecutionPolicy Bypass
git clone https://github.com/powerline/fonts.git
cd fonts
.\install.ps1

REM Printer driver
wget https://gdlp01.c-wss.com/gds/2/0100004462/04/MF4700MFDriversV2090W64usEN.exe
.\MF4700MFDriversV2090W64usEN.exe
