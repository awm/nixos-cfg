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
    openshot-qt # Video editor
    celluloid # Video player
  ];
}
