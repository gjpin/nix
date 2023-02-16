{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "gjpin";
    userEmail = "3874515+gjpin@users.noreply.github.com";
    lfs.enable = true;
  };
}
