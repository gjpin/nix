# https://nixos.wiki/wiki/Visual_Studio_Code
{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    userSettings = {
      "telemetry.telemetryLevel" = "off";
      "window.menuBarVisibility" = "toggle";
      "workbench.startupEditor" = "none";
      "editor.fontFamily" = "Noto Sans Mono";
      "workbench.enableExperiments" = false;
      "workbench.settings.enableNaturalLanguageSearch" = false;
      "workbench.iconTheme" = null;
      "workbench.tree.indent" = 12;
      "window.titleBarStyle" = "native";
      "extensions.ignoreRecommendations" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "workbench.colorTheme" = "Adwaita Dark & default syntax highlighting";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [
              "nixpkgs-fmt"
            ];
          };
        };
      };
    };

    extensions = with pkgs.vscode-extensions; [
      piousdeer.adwaita-theme # theme
      jnoortheen.nix-ide # nix language support
      haskell.haskell # haskell language support
    ];
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
