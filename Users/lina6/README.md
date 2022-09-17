# Windows dot files

I decided to not develop on Windows because Windows seems a bit laggy compared to mac and Linux.

## TODOs

- git config and other dot files
- find a command to run the script with elevated privileges

## Dot files

1. Log into https://github.com
2. [Install chocolatey](https://chocolatey.org/install)
3. Install cmder
   1. `choco feature enable -n=allowGlobalConfirmation`
   2. `choco install cmder -y`
4. Download the dot files in cmder

```sh
git init --bare C:\.cfg
git --git-dir=C:\.cfg --work-tree=C:\ config --local status.showUntrackedFiles no
git --git-dir=C:\.cfg --work-tree=C:\ remote add origin git@github.com:Fullchee/windows-dotfiles.git
git --git-dir=C:\.cfg --work-tree=C:\ fetch origin
git --git-dir=C:\.cfg --work-tree=C:\ reset --hard origin/main

git --git-dir=C:\.cfg --work-tree=C:\ branch --set-upstream-to=origin/main master
```

5. Run `.post-install.cmd` in an elevated terminal

## Manual steps

- Freedom
  - wget https://cdn.freedom.to/installers/FreedomSetup.exe
  - Add device to the list
- Microsoft Office 2007
- Night Light (Windows settings)
- Notifications: Disable
- Printer driver

  - https://gdlp01.c-wss.com/gds/2/0100004462/04/MF4700MFDriversV2090W64usEN.exe

- ssh key

  - `ssh-keygen`
  - `cat ~/.ssh/id_rsa.pub`
  - https://github.com/settings/keys

- Steam games
- Shutdown at 11 PM

  - Task Scheduler
  - https://www.youtube.com/watch?v=ZsQJdaHB3ZM

- Todoist: https://todoist.com/downloads/windows?lang=en
- WSL https://aka.ms/wslinstall
  - Ubuntu (Microsoft Store)

### Startup Items

- Disable
  - OneDrive
  - Discord
  - other stuff

## Windows notes

### Folder Shortcuts

1. Folder Shortcut to the Taskbar
   1. Create a new shortcut (Desktop -> right click -> New shortcut) with the command `explorer.exe <path to folder>`
   2. Change the icon (Right click shortcut -> Properties)
   3. Drag the shortcut to the taskbar
2. Folder shortcut in the start menu

### Services

- delete a service: `sc delete <service_name>` (not the service display name)
  - see the services (control panel), double click the service to get the service name
- `sc stop <service_name>`
- `sc start <service_name>`

(note: use `sc` over `net`, sc is newer (but still older than me) and has more options)

### Batch File notes

**Comment/Remark**: `REM this line is a comment`
`@ECHO OFF`: don't print the actual commands that are run, just the output of those commands

- usually the first line of a batch file
  **variables in a batch file**: `Set <var-name>=<var-value>`

`pause`: Prints the prompt `Press any key to continue ...` and waits until a key is pressed.

#### Debugging Batch Files

**Error**: `path specified not found` after running a batch file

1. Comment out the `@echo off` to see what commands are actually running
2. add a `pause` at the end of the script to see exactly which command failed.

- this error is really misleading, makes you make some false assumptions

#### Get a timestamp

```batch
@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
echo fullstamp: "%fullstamp%"
```

### #View the command that created a process

1. Task Manager (Ctrl-shift-esc)
2. Go to the processes tab
3. Right click and click details
4. Show Columns
5. Command line

Find the process number that is using the port
`netstat -aon | find /i "port number"`

Kill the process given their PID
`Taskkill /PID "pid" /F`

EZBlocket (Block desktop Spotify ads)

WizTree (Faster than WinDirStat)

[Stop Windows Updates](https://www.majorgeeks.com/files/details/stopupdates10.html)

[Disable Bing in Start search](https://www.howtogeek.com/224159/how-to-disable-bing-in-the-windows-10-start-menu/)

## File Explorer

- Show Hidden Files
  1.  Open File Explorer from the taskbar.
  2.  Select View > Options > Change folder and search options.
  3.  Select the View tab and, in Advanced settings, select Show hidden files, folders, and drives and OK.

### Folder Shortcuts

1. Folder Shortcut to the Taskbar
   1. Create a new shortcut (Desktop -> right click -> New shortcut) with the command `explorer.exe <path to folder>`
   2. Change the icon (Right click shortcut -> Properties)
   3. Drag the shortcut to the taskbar
2. Folder shortcut in the start menu

## Notepad++

- Default language to save: `Settings->Preferences->New Document->Default Language`
- Settings -> Shortcut mapper (set Ctrl - r to Reload from Disk)

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
