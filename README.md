# Install
```bash
git clone https://github.com/gjpin/nix.git
cd nix
./bootstrap.sh

reboot and login

git clone https://github.com/gjpin/nix.git
cd nix
nix develop
home-manager switch --flake ".#${USER}@${hostname}"
```

# Update
```bash
sudo nixos-rebuild switch --flake .#hostname

home-manager switch --flake .#username@hostname
```