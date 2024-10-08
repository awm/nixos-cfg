#
# Essential Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  # Prefer dark mode.
  dconf.settings."org.gnome.desktop.interface".color-scheme = "prefer-dark";

  # Enable keyring.
  services.gnome-keyring.enable = true;

  # Configure GPG.
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  programs.gpg.enable = true;

  # Ensure Flatpak apps are found.
  xdg.systemDirs.data = [
    "$HOME/.local/share/flatpak/exports/share"
  ];

  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    # Browser
    (ungoogled-chromium.override {
      enableWideVine = true;
    })
    speedcrunch # Calculator
    keepassxc # Password manager
    libreoffice-fresh # LibreOffice suite
    hunspell # Spellchecker
    hunspellDicts.en_CA # Canadian English spellcheck dictionary
    deja-dup # Backup application
    poppler_utils # PDF conversion tools
  ];
  services.flatpak.packages = [
    "com.usebottles.bottles" # Bottles for Windows apps
  ];
}
