# Linux

## Applications
- [Darling](https://github.com/darlinghq/darling) - run MacOS apps on Linux
- [flameshot](https://github.com/lupoDharkael/flameshot) - Powerful yet simple to use screenshot software
- GParted
- [kcolorchooser](https://apps.kde.org/kcolorchooser/)
- Syncthing

## Articles
- [Common commands](https://www.pixelbeat.org/cmdline.html)
- [Do not use `sudo` to edit a file, use `sudo -e`](https://www.reddit.com/r/linux/comments/osah05/ysk_do_not_use_sudo_vimnanoemacs_to_edit_a_file/)
- [File handling in Unix](https://rachelbythebay.com/w/2020/08/11/files/)
- [How Unix Works](https://neilkakkar.com/unix.html)
- [Linux Kernel Teaching](https://linux-kernel-labs.github.io/refs/heads/master/index.html)
- [The Slab Allocator in the Linux kernel](https://hammertux.github.io/slab-allocator)

## General
- [It's FOSS's Linux Jargon Buster](https://itsfoss.com/category/explain/)
- [LWN.net](https://lwn.net/) - Linux focused news-site
- [The Art of Unix Programming](https://arp242.net/taoup.html)
- [The Linux Documentation Project](https://tldp.org/docs.html)

### Development
- [The Linux Kernel Module Programming Guide](https://sysprog21.github.io/lkmpg/)

### Resetting Passwords

#### If you're not logged in (and the disk isn't encrypted)
- Boot into GRUB, hit `e` to edit the GRUB config for only this boot
  - In the line that starts with 'linux' change `ro` to `rw` and add `init=/bin/sh` at the end of that line
- `Ctrl` + `x` to exit, then boot normally
- Reset your password with `passwd`
  - You might also have to run `mount -o remount,rw /` to make the filesystem writable. This command remounts `/` (root filesystem) in place
- Or, you can create a new user without a password by running `vi /etc/shadow` and adding a line like `alex::18159::::::` (username is alex, no password)
- Run `sync` to flush changes
- Reboot

[Other options](http://www.linuxandubuntu.com/home/how-to-reset-root-password-in-ubuntu)

## Repos
- [Awesome Linux](https://github.com/aleksandar-todorovic/awesome-linux)
- [Awesome Linux Dev](https://github.com/madbob/awesome-linux-dev)
- [Awesome Linux Software](https://github.com/luong-komorebi/Awesome-Linux-Software)
- [linux insides](https://github.com/0xAX/linux-insides) - A book-in-progress about the linux kernel and its insides.
