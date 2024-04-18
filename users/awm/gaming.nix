#
# Gaming Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    discord # Messaging

    protontricks
    protonup-qt
    gamescope
    (lutris.override {
      extraPkgs = pkgs: [
        gamescope
        gamemode
        mangohud
      ];
    })
    gnomeExtensions.gamemode-indicator-in-system-settings
  ];

  # GPU statistics HUD
  programs.mangohud = {
    enable = false;
    enableSessionWide = false;
  };
}
