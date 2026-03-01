#
# Graphics and media tool configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    pinta # Simple paint application
    amberol # Music player
    celluloid # Video player
  ];
}
