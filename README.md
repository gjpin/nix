# Install
```bash
git clone https://github.com/gjpin/nix.git
cd nix
./bootstrap.sh
sudo nixos-install --no-root-passwd --flake .#hostname

reboot
passwd

home-manager switch --flake .#username@hostname
```