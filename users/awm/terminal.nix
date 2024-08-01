#
# Terminal Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  # Bash shell.
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      glog = "git log --oneline --decorate --graph";
    };
  };

  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    starship # Command prompt
  ];

  # Starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # Use WezTerm as a terminal application
  programs.wezterm = {
    enable = true;
    extraConfig = ''return {
      xcursor_theme = 'Adwaita',
    }'';
  };

  # Direnv for per-directory environments
  programs.direnv.enable = true;
}
