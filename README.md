# Manual install

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
