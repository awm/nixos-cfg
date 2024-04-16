#
# User Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home settings.
  home.username = "awm";
  home.homeDirectory = "/home/awm";

  # Prefer dark mode.
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  ### User Packages ###

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Desktop essentials
    ungoogled-chromium # Browser
    
    # Console tools
    alacritty
    starship
    
    # Development tools
    lapce # Text editor
    
    # Gaming
    discord
  ];

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

  # Alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

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

  # Enable keyring.
  services.gnome-keyring.enable = true;

  # Configure GPG.
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };
  programs.gpg.enable = true;
}
