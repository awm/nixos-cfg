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
  
  ### Kernel Configuration ###
  
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  ### Firmware Update Configuration ###
  
  # Allow microcode updates.
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  
  # Enable firmware and UEFI updates.
  services.fwupd.enable = true;
  
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
}
