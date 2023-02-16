# https://github.com/NixOS/nixos-hardware/tree/master/common/cpu/amd

{
  hardware.cpu.amd.updateMicrocode = true;
  boot.initrd.kernelModules = [ "kvm-amd" ];
}
