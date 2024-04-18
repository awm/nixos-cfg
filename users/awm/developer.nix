#
# Developer Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  # Git configuration.
  programs.git = {
    enable = true;
    userName = "Andrew MacIsaac";
    userEmail = "macisaac.andrew@gmail.com";
    signing = {
      signByDefault = true;
      key = null;
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
  
  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    lapce # Text editor
  ];
}
