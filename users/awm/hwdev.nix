#
# Hardware Development Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  ### User Packages ###

  # Additional packages.
  services.flatpak.packages = [
    "org.kicad.KiCad" # KiCAD for EDA
  ];
}
