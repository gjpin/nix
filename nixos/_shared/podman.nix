# https://nixos.wiki/wiki/Podman
{ lib, ... }:
{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # Enable docker.io as unqualified search registry
  environment.etc."containers/registries.conf".text = lib.mkForce ''
    unqualified-search-registries = ["docker.io"]
  '';
}
