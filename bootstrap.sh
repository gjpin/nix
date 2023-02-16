#!/usr/bin/env bash

read -p "LUKS password: " LUKS_PASSWORD
export LUKS_PASSWORD

# Delete old partition layout and re-read partition table
sudo wipefs -af /dev/nvme0n1
sudo sgdisk --zap-all --clear /dev/nvme0n1
sudo partprobe /dev/nvme0n1

# Partition disk and re-read partition table
sudo sgdisk -n 1:0:+1G -t 1:ef00 -c 1:boot /dev/nvme0n1
sudo sgdisk -n 2:0:0 -t 2:8309 -c 2:luks /dev/nvme0n1
sudo partprobe /dev/nvme0n1

# Create and open LUKS partition
echo ${LUKS_PASSWORD} | sudo cryptsetup --type=luks2 --hash=sha512 --use-random --label=luks luksFormat /dev/nvme0n1p2
echo ${LUKS_PASSWORD} | sudo cryptsetup luksOpen /dev/nvme0n1p2 cryptdev

# Create BTRFS volume and subvolumes
sudo mkfs.btrfs --label cryptdev /dev/mapper/cryptdev
sudo mount -t btrfs /dev/mapper/cryptdev /mnt
sudo btrfs subvolume create /mnt/root
sudo btrfs subvolume create /mnt/nix
sudo btrfs subvolume create /mnt/persist

# Take an empty readonly snapshot of the root subvolume
sudo btrfs subvolume snapshot -r /mnt/root /mnt/root-blank

# Mount BTRFS subvolumes
sudo mount -o subvol=root,compress=zstd,noatime /dev/mapper/cryptdev /mnt
sudo mount -o subvol=nix,compress=zstd,noatime /dev/mapper/cryptdev /mnt/nix
sudo mount -o subvol=persist,compress=zstd,noatime /dev/mapper/cryptdev /mnt/persist

# Format and mount EFI/boot partition
sudo mkfs.fat -F32 -n boot /dev/nvme0n1p1
sudo mount --mkdir /dev/nvme0n1p1 /mnt/boot

# Enable flakes
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

echo "Run \"sudo nixos-install --no-root-passwd --flake .#hostname\""