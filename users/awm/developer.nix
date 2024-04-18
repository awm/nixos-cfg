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
    lapce # Experimental text editor

    # Nix formatting
    nixd        # Nix language server
    nixpkgs-fmt # Nix formatter
  ];

  # Install VS Codium.
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "sync-settings";
        publisher = "zokugun";
        version = "0.16.0";
        sha256 = "97b4b3bf8b6d5e8c31b86becb11cef7a5eaf5fcb950f827b0e55c9efd23b6fc4";
      }
    ];
  };
}
