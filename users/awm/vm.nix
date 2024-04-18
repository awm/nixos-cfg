#
# VM Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  # Enable VM connections.
  dconf.settings."org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };

  # Enable VM manager.
  programs.virt-manager.enable = true;

  ### User Packages ###

}
