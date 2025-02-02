#
# Framework 16 Laptop Hardware Definitions
#
{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  ### System Setup ###

  # Select architecture.
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Enable Power Profiles Daemon for improved battery life
  services.power-profiles-daemon.enable = true;

  # Allow microcode updates.
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Bootloader configuration.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ### Kernel Configuration ###

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "amdgpu" "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [ "amdgpu.abmlevel=1" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  ### System Packages ###

  # Install system packages.
  environment.systemPackages = with pkgs; [
    # Security and authentication
    fprintd

    # System tools
    fwupd
    framework-tool
  ];

  # Enable fingerprint scanner.
  services.fprintd.enable = true;
  # Enable firmware and UEFI updates.
  services.fwupd.enable = true;

  # Graphics packages
  hardware.opengl = {
    enable = true;
    driSupport.enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      mangohud
      gamescope
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      mangohud
      gamescope
    ];
  };
  hardware.steam-hardware.enable = true;
}
