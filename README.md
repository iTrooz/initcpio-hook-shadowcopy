# initcpio-hook-shadowcopy
This ArchLinux package provides an initcpio hook to copy your /etc/shadow in your initramfs, allowing you to debug initramfs in emergency mode instead of getting
```
Cannot open access to console, the root account is locked.
See sulogin(8) man page for more details.
```

# Usage
1. Install the package:
```bash
yay -S initcpio-hook-shadowcopy
```
(any AUR helper will do, or you can build it manually with `makepkg`)

2. Add the hook to your `/etc/mkinitcpio.conf`:
```bash
HOOKS=(base systemd shadowcopy ...)
```
Note: the `systemd` hook overwrites `/etc/shadow`, so `shadowcopy` must be placed **after it**.

3. Rebuild your initramfs:
```bash
# mkinitcpio -P
```

You can then reboot, and login to your root account in emergency mode.

# Using another root password for initramfs
Copying your `/etc/shadow` to initramfs when you use an encrypted root partition has the downside of leaking **every account** passwords outside it.
If you use an encrypted root partition, you can use a different password for the root account in initramfs by creating a file `/etc/shadow.initramfs` using the same format as `/etc/shadow`.

You can create the file like this:
```bash
echo "root:$(mkpasswd 'YOUR_PASSWORD'):::::::" > /etc/shadow.initramfs
```
If you want to generate a password that can be typed on azert and qwerty keyboards alike, you can use [this script](https://gist.github.com/iTrooz/58402fb3a42337a2f4b5a10ed397113c).
