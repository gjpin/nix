# https://nixos.wiki/wiki/Intel_Graphics
# https://github.com/NixOS/nixos-hardware/blob/master/common/gpu
# https://nixos.org/manual/nixos/unstable/index.html#sec-gpu-accel-va-api-intel

{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "i915" ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
