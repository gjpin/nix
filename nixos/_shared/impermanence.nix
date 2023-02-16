{ inputs, ... }:
{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/containers"
      "/etc/NetworkManager/system-connections"
      { directory = "/home"; user = "zero"; group = "zero"; }
    ];
    files = [
      "/etc/machine-id"
    ];
  };

  # Required for home-manager/_shared/impermanence.nix
  programs.fuse.userAllowOther = true;
}
