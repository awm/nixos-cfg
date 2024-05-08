#
# Virtualization Configuration for "awm"
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

  # Additional packages.
  home.packages = with pkgs; [
    dive # Look into docker image layers
    podman-tui # Status of containers in the terminal
    podman-compose # Start group of containers for dev
    buildah # To build container images
    libguestfs-with-appliance # Tools for accessing guest filesystems
  ];
}
