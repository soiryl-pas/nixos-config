# NixOS-Configuration

## TODOs

* direnv and vscodium
    * Doesn't have access to flake.nix envvars and aliasses (or throws errors)
    * compile_commands.json must be specified

* Keeping certain Dotfiles mutable in HomeManager

* Custom Qt6 Theme in all DEs and WMs

* Neovim Config - If possible, configurable per devshell-flake
    * telescope, nvim-cmp, language servers, formatters, treesitter, tokyonight-theme, NvimTree

* Hyprland Setup (Alternatively, QTile)

* Include https://github.com/pudii/gba-ghidra-loader in Ghidra

* .desktop-file for Stirling PDF

* Setup Fcitx5 correctly

## Imperative Configuration:
This section lists things to be done imperatively, as these systems are either in a highly volatile developing stage, rendering the declerative paradigm unreasonable (Zen), or simply too complex to bother (KDE).

* Plasma
    * Theme to Breezedark
    * Panel Position to Right and Size 50
    * Clock to ISO Date
    * clickItemTo open
    * Locale
    * Theme Colour: Purple
    * Change CTRL+Alt+t and Default Terminal to Kitty
* Dolphin
    * Make Location Bar Editable, Show Full Path
    * Remember Display Style for Each Directory
    * Date Style: Absolute
    * Panel: Use Condensed Date
    * Show on Startup: Home-Directory
* Zen
    * All Settings, especially Keyboard Shortcuts, Look and Feel, Search, Security
* OnlyOffice
    * Change to Dark Mode
* Prismlauncher
    * Setup, giving Minecraft 16GB of RAM should be totally fine.

## Caveats
* User service plasma-kwallet-pam.service consistently fails as its functionality is implemented in /etc/profile. This should be irrelevant, but could lead to unexplained behaviour in Plasma.
* In the current setup, TTY Environments cannot declare and save new passwords, only graphical interfaces can. After decleration and saving in kwallet, they are however available in the TTY as well. This is due to QT\_QPA\_ENVIRONMENT=offscreen (necessary for using kwallet in TTYs) misbehaving for new passwords.
* The official minecraft launcher is tagged as broken and nonfunctional, and Modrinth doesn't really work as well. The official nixos-wiki recommends Prismlauncher.
