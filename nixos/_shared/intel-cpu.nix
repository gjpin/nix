# https://github.com/NixOS/nixos-hardware/blob/master/common/cpu/intel/cpu-only.nix

{
  hardware.cpu.intel.updateMicrocode = true;
  boot.initrd.kernelModules = [ "kvm-intel" ];
}
