#
# User Configuration for "awm"
#
{ pkgs, flatpaks, ... }:
{
  ### Setup ###

  # Import sub-configurations.
  imports = [
    flatpaks.homeManagerModules.nix-flatpak

    ./essentials.nix
    ./terminal.nix
    ./developer.nix
    ./hwdev.nix
    ./vm.nix
    ./gaming.nix
  ];

  home = {
    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.11";

    # Home settings.
    username = "awm";
    homeDirectory = "/home/awm";
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
