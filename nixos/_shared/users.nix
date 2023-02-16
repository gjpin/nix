{
  # Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    zero = {
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
        "audio"
      ];
    };
  };
}
