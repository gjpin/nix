{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adw-gtk3";
      color-scheme = "default";
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Shift><Super>q" ];
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      move-to-workspace-1 = [ "<Shift><Super>exclam" ];
      move-to-workspace-2 = [ "<Shift><Super>at" ];
      move-to-workspace-3 = [ "<Shift><Super>numbersign" ];
      move-to-workspace-4 = [ "<Shift><Super>dollar" ];
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Shift><Super>s" ];
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "small-plus";
    };

    "org/gnome/desktop/interface" = {
      font-name = "Noto Sans Regular 10";
      document-font-name = "Noto Sans Regular 10";
      monospace-font-name = "NotoSansMono Nerd Font Mono Regular 10";
    };

    "org/gnome/desktop/wm/preferences" = {
      titlebar-font = "Noto Sans Bold 10";
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "firefox.desktop"
        "org.gnome.Console.desktop"
        "code.desktop"
      ];

      disable-user-extensions = false;

      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "dark-variant@hardpixel.eu"
        "rounded-window-corners@yilozt"
        "gsconnect@andyholmes.github.io"
      ];

      # extensions.dark-variant.applications = [
      #   "code.desktop"
      #   "insomnia.desktop"
      #   "spotify.desktop"
      #   "gimp.desktop"
      #   "com.heroicgameslauncher.hgl.desktop"
      #   "obsidian.desktop"
      #   "godot.desktop"
      #   "blender.desktop"
      #   "com.discordapp.Discord.desktop"
      # ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kgx";
      name = "Gnome Console";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>E";
      command = "nautilus";
      name = "Nautilus";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Shift><Control>Escape";
      command = "gnome-system-monitor";
      name = "Gnome System Monitor";
    };

  };
}
