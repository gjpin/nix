# Install
```bash
git clone https://github.com/gjpin/nix.git
cd nix
./bootstrap.sh

reboot and login

passwd
git clone https://github.com/gjpin/nix.git
cd nix
nix develop
home-manager switch --flake .#zero@hostname
```

# Update
```bash
sudo nixos-rebuild switch --flake .#hostname

home-manager switch --flake .#zero@hostname
```

# Check differences in /etc
```bash
#!/usr/bin/env bash
# fs-diff.sh
set -euo pipefail

OLD_TRANSID=$(sudo btrfs subvolume find-new /mnt/root-blank 9999999)
OLD_TRANSID=${OLD_TRANSID#transid marker was }

sudo btrfs subvolume find-new "/mnt/root" "$OLD_TRANSID" |
sed '$d' |
cut -f17- -d' ' |
sort |
uniq |
while read path; do
  path="/$path"
  if [ -L "$path" ]; then
    : # The path is a symbolic link, so is probably handled by NixOS already
  elif [ -d "$path" ]; then
    : # The path is a directory, ignore
  else
    echo "$path"
  fi
done


sudo mkdir /mnt
sudo mount -o subvol=/ /dev/mapper/enc /mnt
./fs-diff.sh
```