# Personal NixOS Configuration

This is my first foray into NixOS.  I don't claim to be an expert by any means :smile:.

In the future I may explore other features such as impermanence and secure boot.

## Game Configurations

So far, the following games have worked well on my Framework 16 with discrete GPU:

### StarCraft II

**Setup:**

 1. Add the [Windows Battle.net installer](https://download.battle.net/en-us/?product=bnetdesk) as a non-Steam game named "Battle.net" in Steam.
 2. Force the use of Proton 8.0-5 in the game's Steam configuration.
 3. Run the "game" to install the Battle.net Launcher.
 4. Log into Battle.net and install StarCraft II.
 5. Start StarCraft II from the Battle.net Launcher and adjust the in-game screen resolution to 2560 x 1600.

On subsequent runs I just launch the same "Battle.net" entry, as the installer will start the Battle.net Launcher if it is already present, and from there I start StarCraft.

### Horizon Zero Dawn

**Setup:**

 1. In the game's Steam settings, force the use of Proton 8.0-5.
 2. Install the game as usual through Steam.
 3. Allow Vulkan shader generation to run to completion on first startup (this took several minutes).

Subsequently, I just launch the game from Steam as usual.

## Resources and References

I found the following useful while constructing this configuration:

 * [amesb/nixos: My personal NixOS config](https://github.com/amesb/nixos)
 * [CodeMichael/nix: My install NixOS on FW16](https://gitlab.com/CodeMichael/nix)
 * [MyNixOS](https://mynixos.com/)
 * [NixOS & Flakes Book - An unofficial book for beginners](https://nixos-and-flakes.thiscute.world/)
 * [NixOS Discourse](https://discourse.nixos.org/)
 * [NixOS Manual](https://nixos.org/manual/nixos/stable/)
 * [NixOS on the Framework Laptop 16](https://community.frame.work/t/nixos-on-the-framework-laptop-16/46743)
 * [NixOS Search - Packages](https://search.nixos.org/packages)
 * [NixOS Wiki](https://nixos.wiki/wiki/Main_Page)
