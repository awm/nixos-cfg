#
# VM Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  # Enable VM connections.
  dconf.settings."org/virt-manager/virt-manager/connections" = {
    autoconnect = [ "qemu:///system" ];
    uris = [ "qemu:///system" ];
  };

  ### User Packages ###

}
