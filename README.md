# Manual install

## Installation

## To be automated
### Dot files

1. Log into
2. [Install chocolatey](https://chocolatey.org/install)
3. Run .post-install.sh

## Microsoft Store
- Windows terminal
- Ubuntu
- Install WSL https://aka.ms/wslinstall 

## Startup Items
- Disable OneDrive

Install Microsoft Office 2007

## Choco
```
choco feature enable -n=allowGlobalConfirmation
choco install adobereader -y
choco install authy-desktop -y
choco install autohotkey -y
choco install bitwarden -y
choco install curl -y
choco install docker-desktop -y
choco install discord -y
choco install dropbox -y
choco install f.lux -y
choco install firefox -y
choco install ghostscript.app -y
choco install git.install -y
choco install googlechrome -y
choco install keepass -y
choco install miniconda3 -y
choco install nodejs.install -y
choco install paint.net -y
choco install postman -y
choco install qbittorrent -y
choco install sharex -y
choco install steam -y
choco install vlc -y
choco install vscode -y
choco install yarn -y
choco install zoom -y
```


Cmder? 
(where do I put my aliases?)

### path (NOTE: add to `Path` the system variable, not just `PATH`, the user variable)
- there two environment variables with the name `path`
```batch

```
- path to subl.exe
- path to git
- path to node
- path to VSCode
- path to python
- path to an `aliases` folder of batch files (to mimic a UNIX terminal workflow)

- Notepad Replacer
- assign a program to open all files with an extension: `Control Panel -> Programs -> Default Programs -> Associate a file type or protocol with a program`
    - avoid accidentally double clicking on batch files (.bat)
    - forces me to only call batch files using a terminal

## File Explorer
#### Folder Shortcuts
1. Folder Shortcut to the Taskbar
    1. Create a new shortcut (Desktop -> right click -> New shortcut) with the command `explorer.exe <path to folder>`
    2. Change the icon (Right click shortcut -> Properties)
    3. Drag the shortcut to the taskbar
2. Folder shortcut in the start menu

## Usage
### Connect to a networked Windows Computer from mac
**GUI**: Microsoft Remote Desktop (from App Store)
**command line**: 
1. Finder: Cmd-k and connect to the Windows instance.
2. Terminal: The Windows file system is accessible from the directory: `/Volumes/`

### Connect to other computers on the same network
File Explorer: Type the following in the path: `\\<any computer IP Address>\<path>`

## Command Line

### Open File Explorer from cmd
`start <path>`
- start is similar to the `open` command on UNIX, can open/start files and folders, opens with the default program

### How to get my IP Address (command line)
`ipconfig`

### How to redirect the output to a file
`<cmd> > stderrAndOut.log 2>&1`
- similar syntax as UNIX!
- you have to put the file in between the `>` and the `2>&1`

### Cmder: how to turn off git (faster in large git repos)
https://github.com/cmderdev/cmder/issues/447#issuecomment-244149494

### Servies
- delete a service: `sc delete <service_name>` (not the service display name)
    - see the services (control panel), double click the service to get the service name
- `sc stop <service_name>`
- `sc start <service_name>`

(note: use `sc` over `net`, sc is newer (but still older than me) and has more options)
## Batch Files
**Comment/Remark**: `REM this line is a comment`
`@ECHO OFF`: don't print the actual commands that are run, just the output of those commands
- usually the first line of a batch file
**variables in a batch file**: `Set <var-name>=<var-value>`

`pause`: Prints the prompt `Press any key to continue ...` and waits until a key is pressed.

### Debugging Batch Files
**Error**: `path specified not found` after running a batch file
1. Comment out the `@echo off` to see what commands are actually running
2. add a `pause` at the end of the script to see exactly which command failed.
- this error is really misleading, makes you make some false assumptions

### Get a timestamp
```batch
@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
echo fullstamp: "%fullstamp%"
```

### View the command that created a process
1. Task Manager (Ctrl-shift-esc)
2. Go to the processes tab
3. Right click and click details
4. Show Columns
5. Command line


### Keyboard/BIOS
**Change the keyboard to use the function keys instead of multi-media functions**
1. Restart the computer
2. Open the BIOS
3. Dell: In the Advanced Tab, change the `Function Key Behaviour` option

Find the process number that is using the port
`netstat -aon | find /i "port number"`

Kill the process given their PID
`Taskkill /PID "pid" /F`

EZBlocket (Block desktop Spotify ads)

WizTree (Faster than WinDirStat)

[Stop Windows Updates](https://www.majorgeeks.com/files/details/stopupdates10.html)

[Disable Bing in Start search](https://www.howtogeek.com/224159/how-to-disable-bing-in-the-windows-10-start-menu/)

## File Explorer
* Show Hidden Files
   1. Open File Explorer from the taskbar. 
   2. Select View > Options > Change folder and search options.
   3. Select the View tab and, in Advanced settings, select Show hidden files, folders, and drives and OK.
### Folder Shortcuts
1. Folder Shortcut to the Taskbar
    1. Create a new shortcut (Desktop -> right click -> New shortcut) with the command `explorer.exe <path to folder>`
    2. Change the icon (Right click shortcut -> Properties)
    3. Drag the shortcut to the taskbar
2. Folder shortcut in the start menu

## Notepad++
* Default language to save: `Settings->Preferences->New Document->Default Language`
* Settings -> Shortcut mapper (set Ctrl - r to Reload from Disk)

## Cmder
TODO: add this to a windows dotfiles repo
Default Directory
In the init.bat file in ~/cmder/vendor, before

:: Set home path
add

@cd /d "C:/YOUR_PREFERRED_FOLDER/"

Notepad++
Update silently when a file has been modified outside of N++
https://superuser.com/questions/206226/stop-notepad-warning-if-file-has-been-modified-from-outside
