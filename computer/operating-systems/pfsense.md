# pfsense

## Default Logins

### Web UI
```
Username: admin
Password: pfsense
```

## Getting into pfSense without creds

1. Reboot pfSense box
2. Choose option 4 (Single User Mode)
3. Press enter to start sh
4. Remount the drive as rewritable
   `/sbin/mount -o rw /`
5. Run the built-in password reset command
   `/etc/rc.initial.password`
6. Follow prompts to reset password
7. Reboot
   `/sbin/reboot`

[Source](https://www.netgate.com/docs/pfsense/usermanager/locked-out-of-the-webgui.html)

## Walkthroughs
- [pfSense in VirtualBox](https://samuraihacks.com/install-pfsense-in-virtualbox/)
