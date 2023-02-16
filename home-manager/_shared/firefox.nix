# https://nixos.wiki/wiki/Firefox

{ pkgs, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.firefox = {
    enable = true;
    profiles.zero = {
      extensions = with addons; [
        ublock-origin
        bitwarden
        multi-account-containers
        floccus
      ];
      settings = {
        "media.ffmpeg.vaapi.enabled" = true;
        "browser.tabs.inTitlebar" = 1;
        "browser.tabs.firefox-view" = false;
        "browser.tabs.tabmanager.enabled" = false;
        "signon.rememberSignons" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "general.autoScroll" = true;
        # Disable pocket
        "browser.pocket.enabled" = false;
        "extensions.pocket.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        # Tracking protection
        "browser.contentblocking.category" = "strict";
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.pbmode.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "network.cookie.cookieBehavior" = 5;
        # Telemetry
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.healthreport.service.enabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "browser.discovery.enabled" = false;
        # Experiments
        "experiments.supported" = false;
        "experiments.enabled" = false;
        "experiments.manifest.uri" = "";
        "network.allow-experiments" = false;
        # Misc privacy
        "geo.enabled" = false;
        "beacon.enabled" = false;
        "media.webspeech.recognition.enable" = false;
        "media.webspeech.synth.enabled" = false;
        "browser.send_pings" = false;
        "extensions.getAddons.cache.enabled" = false;
        "lightweightThemes.update.enabled" = false;
        "plugin.state.flash" = 0;
        "plugin.state.java" = 0;
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        "privacy.resistFingerprinting" = true;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        "extensions.shield-recipe-client.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "loop.logDomains" = false;
        "browser.newtabpage.enhanced" = false;
        "browser.newtab.preload" = false;
        "browser.newtabpage.directory.ping" = "";
        "browser.newtabpage.directory.source" = "data:text/plain,{}";
        "dom.security.https_only_mode" = true;
        # Firefox Gnome theme
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uidensity" = 0;
        "svg.context-properties.content.enabled" = true;
        "browser.theme.dark-private-windows" = false;
      };
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
      '';
      userContent = ''
        @import "firefox-gnome-theme/userContent.css"; 
      '';
    };
  };

  home = {
    file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/zero/chrome/firefox-gnome-theme";
      source = (fetchTarball {
        url = "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/refs/tags/v109.tar.gz";
        sha256 = "19zj2488ppba02y5c0wv69rd43syvdr8l3lx0vigkf0i9n9grma8";
      });
    };
    persistence = {
      "/persist/home/zero".directories = [ ".mozilla/firefox" ];
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
