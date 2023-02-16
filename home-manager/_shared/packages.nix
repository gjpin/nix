{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jq # JSON pretty printer and manipulator

    nil # Nix LSP
    nixfmt # Nix formatter
    nixpkgs-fmt
  ];
}
