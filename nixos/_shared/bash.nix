# https://nixos.wiki/wiki/Command_Shell

{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.bash;

  environment.shells = with pkgs; [ bash ];

  programs.bash = {
    enableCompletion = true;
    enableLsColors = true;
  };
}
