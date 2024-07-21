#
# Hardware Development Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    gtkwave # Waveform viewer
  ];
  services.flatpak.packages = [
    "org.kicad.KiCad" # KiCAD for EDA
  ];
}
