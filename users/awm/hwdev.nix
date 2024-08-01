#
# Hardware Development Configuration for "awm"
#
{ pkgs, ... }:
{
  ### Setup ###

  ### User Packages ###

  # Additional packages.
  home.packages = with pkgs; [
    gtkwave # Waveform viewer

    # Install Logic
    (appimageTools.wrapType2 {
      name = "logic";
      src = fetchurl {
        url = "https://downloads2.saleae.com/logic2/Logic-2.4.14-linux-x64.AppImage";
        hash = "sha256-qiFTE8/An0um/eP+owtE8fcCX0EnnTg00S2H6OBO38g=";
      };
      extraPkgs = pkgs: with pkgs; [ libnsl ];
    })
  ];
  services.flatpak.packages = [
    "org.kicad.KiCad" # KiCAD for EDA
  ];
}
