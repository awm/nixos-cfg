#
# Common System Configuration
#
{ lib, pkgs, ... }:
{
  imports = [
  ];

  ### System Setup ###

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Do garbage collection weekly to keep disk usage low.
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  ### Network Setup ###

  # Enable networking
  networking.networkmanager.enable = true;

  # Explicitly enable firewall.
  networking.firewall.enable = true;
  
  # Use DHCP.
  networking.useDHCP = lib.mkDefault true;

  ### System Packages ###

  # Install system packages.
  environment.systemPackages = with pkgs; [
    # Basic utilities
    curl
    git
    pciutils
    file
    lshw
    nano
    nanorc

    # Security and authentication
    gnupg
    pinentry

    # Desktop features
    gnomeExtensions.appindicator
  ];

  # Set default editor to nano.
  environment.variables.EDITOR = "nano";

  # Configure system packages.
  programs.dconf.enable = true;

  # Remove some GNOME stuff that is undesirable.
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  ### Users and Groups ###

  users.users.awm = {
    isNormalUser = true;
    description = "Andrew MacIsaac";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
  };
}
