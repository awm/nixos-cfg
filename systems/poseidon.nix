#
# System Configuration for "poseidon" (Framework 16 Laptop)
#
{ ... }:
{
  imports = [ 
    ./configuration.nix
    ../hardware/framework-16.nix
  ];

  ### Network Setup ###
  
  # Set host name.
  networking.hostName = "poseidon"; # Define your hostname.
  
  ### Disk Setup ###

  # Encrypted boot devices.
  boot.initrd.luks.devices."luks-8ff84575-eefa-4b42-b21e-b0f348657e4d".device = "/dev/disk/by-uuid/8ff84575-eefa-4b42-b21e-b0f348657e4d";
  boot.initrd.luks.devices."luks-0cfbff98-e4b7-43d8-8120-21cdc580554c".device = "/dev/disk/by-uuid/0cfbff98-e4b7-43d8-8120-21cdc580554c";

  # Disk partitions.
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/7e5fd3c7-2f25-49bc-8dea-ad5cea5d9823";
    fsType = "ext4";
  };
  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/4D5A-87E1";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };
  swapDevices = [ 
    { device = "/dev/disk/by-uuid/ddcea5ed-1ff9-4642-be70-793a3f52b629"; }
  ];

  ### Graphics Setup ###

  # Enable gaming software.
  programs.steam.enable = true;
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 10;
      };
    };
  };
}
