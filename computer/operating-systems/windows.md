# Windows

## Access built-in Windows license from Linux
`# strings /sys/firmware/acpi/tables/MSDM`

## Factory Reset

## "The computer restarted unexpectedly or encountered an unexpected error..."
- Shift + F10 to open cmd
- `> regedit`
- HKEY_LOCAL_MACHINE > SYSTEM > Setup > Status > ChildCompletion
- Change setup.exe from 1 to 3

## Password Reset
### If you're logged in as Admin user

- Open `Computer Management` -> `Local Users and Groups` -> `Users`
- Right click on a user and choose `Set Password`
- You can disable any users that you are unfamiliar with
  - Don't delete them in case they are needed for scripts, programs, etc.

### If you're not logged in

- [Sticky Keys Hack](https://fossbytes.com/sticky-key-feature-and-reset-windows-password-using-cmd/)
  - Boot into a live OS, mount the Windows filesystem, and change the program that 5 shifts is bound to from Sticky Keys to `cmd.exe`
  - Another way to do sticky keys without any external devices needed:
    - Power off computer, then power it on
    - When you see the Windows logo, immediately power it off to force your computer to go into recovery mode
    - When you boot into recovery mode, wait for your computer to try to fix the isses
    - If a window pops up asking if you want to use System Restore, click Cancel
    - Wait until the window pops up saying "Startup Repair cannot repair this computer automatically"
    - Click the black triangle by "View problem details", scroll to the very bottom, and click on the file that is linked (X:\windows\system32\en-US\erfflps.txt)
    - You are now in Notepad. Click `File` > `Open`, navigate to `C:\windows\system32` and rename `Utilman.exe` to `Utilman1.exe` and rename `cmd.exe` to `Utilman.exe`. Make sure you are viewing `All Files` as the Type of Files instead of just `.txt`
    - Reboot, click on the accessibility icon, and then run `net users` to list users. Use `net user /add <username>` to add a user and `net user <username> *` to change a password.
- Use [chntpw](https://en.wikipedia.org/wiki/Chntpw) to overwrite the [SAM](https://en.wikipedia.org/wiki/Security_Account_Manager) database
