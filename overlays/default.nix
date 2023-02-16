# This file defines overlays
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    aseprite-unfree = prev.aseprite-unfree.overrideAttrs (oldAttrs: {
      version = "v1.3-beta21";
      src = final.fetchFromGitHub {
        owner = "aseprite";
        repo = "aseprite";
        rev = "v1.3-beta21";
        sha256 = "0000000000000000000000000000000000000000000000000000";
      };
    });
  };
}
