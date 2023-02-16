# https://nixos.wiki/wiki/AMD_GPU
# https://github.com/NixOS/nixos-hardware/blob/master/common/gpu/amd
# https://nixos.org/manual/nixos/unstable/index.html#sec-gpu-accel-vulkan

{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    AMD_VULKAN_ICD = "RADV";
  };
}
