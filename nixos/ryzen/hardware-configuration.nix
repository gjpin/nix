{ lib, pkgs, ... }:
let
  wipeScript = ''
    mkdir -p /mnt
    mount -o subvol=/ /dev/disk/by-label/cryptdev /mnt

    btrfs subvolume list -o /mnt/root | cut -f9 -d ' ' |
    while read subvolume; do
      btrfs subvolume delete "/mnt/$subvolume"
    done &&
    btrfs subvolume delete /mnt/root
    btrfs subvolume snapshot /mnt/root-blank /mnt/root
    umount /mnt
  '';
in
{
  hardware.enableRedistributableFirmware = true;

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      luks.devices."cryptdev".device = "/dev/disk/by-label/luks";
      postDeviceCommands = lib.mkBefore wipeScript;
    };

    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        editor = false;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "btrfs" ];

    kernelPackages = pkgs.linuxPackages_latest;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

    "/nix" = {
      device = "/dev/disk/by-label/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

    "/persist" = {
      device = "/dev/disk/by-label/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

    "/home" = {
      device = "/dev/disk/by-label/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  nix.settings.max-jobs = lib.mkDefault 8;

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
