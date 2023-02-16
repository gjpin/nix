# https://github.com/NixOS/nixos-hardware/blob/master/common/pc/ssd

{ lib, ... }:
{
  services.fstrim.enable = lib.mkDefault true;
}
