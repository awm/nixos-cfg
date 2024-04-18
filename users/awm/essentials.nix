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
    pinentryFlavor = "gnome3";
  };
  programs.gpg.enable = true;

  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    ungoogled-chromium # Browser
    speedcrunch # Calculator
  ];
}
