# https://nixos.wiki/wiki/GNOME
# https://nixos.org/manual/nixos/stable/index.html#chap-gnome
# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/x11/desktop-managers/gnome.nix

{ lib, pkgs, ... }:
{
  # Enable the GNOME Desktop Environment
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    excludePackages = [ pkgs.xterm ];
  };

  programs.dconf.enable = true;

  # Exclude packages
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    epiphany
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-characters
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-music
    gnome-software
    gnome-weather
    simple-scan
    yelp
  ]);

  # Disable services
  services = {
    gnome = {
      at-spi2-core.enable = lib.mkForce false;
      gnome-browser-connector.enable = lib.mkForce false;
      gnome-initial-setup.enable = lib.mkForce false;
      gnome-remote-desktop.enable = lib.mkForce false;
      gnome-user-share.enable = lib.mkForce false;
      rygel.enable = lib.mkForce false;
    };
    avahi.enable = lib.mkForce false;
    dleyna-renderer.enable = lib.mkForce false;
    dleyna-server.enable = lib.mkForce false;
    geoclue2.enable = lib.mkForce false;
    system-config-printer.enable = lib.mkForce false;
    printing.enable = lib.mkForce false;
  };

  # Extensions and theme
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.dark-variant
    gnomeExtensions.rounded-window-corners
    xorg.xprop # dark-variant dependency

    adw-gtk3 # theme
  ];
}
