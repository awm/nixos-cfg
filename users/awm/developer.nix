#
# Developer Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  # Git configuration.
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Andrew MacIsaac";
        email = "macisaac.andrew@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "codium --wait";
      };
    };
    signing = {
      signByDefault = true;
      key = null;
    };
  };

  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    # Nix formatting
    nixd # Nix language server
    nixpkgs-fmt # Nix formatter

    # Network tools
    nmap
    ipmiview

    # Diagramming
    graphviz
  ];

  # Install VS Codium.
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
  };
}
