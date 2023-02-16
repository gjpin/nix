# Install
```bash
git clone https://github.com/gjpin/nix.git
cd nix
./bootstrap.sh
sudo nixos-install --no-root-passwd --flake .#hostname

reboot and login

passwd
nix-shell home-manager
home-manager switch --flake .#username@hostname
```

# Update
```bash
sudo nixos-rebuild switch --flake .#hostname

home-manager switch --flake .#username@hostname
```