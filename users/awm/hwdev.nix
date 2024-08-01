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
    saleae-logic-2 # Saleae Logic analyzer application
  ];
  services.flatpak.packages = [
    "org.kicad.KiCad" # KiCAD for EDA
  ];
}
