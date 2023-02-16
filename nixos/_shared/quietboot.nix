# https://wiki.archlinux.org/title/silent_boot

{
  boot = {
    # Enable Plymouth
    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    # Silent boot
    loader.timeout = 0;
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];
  };
}
