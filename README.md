# NixOS-Configuration

## TODOs

* Custom Qt6 Theme in all DEs and WMs
* Setup Fcitx5 correctly
* .desktop-file for Stirling PDF

* Keeping certain Dotfiles mutable in HomeManager
* Neovim Config - If possible, configurable per devshell-flake
    * telescope, nvim-cmp, language servers, formatters, treesitter, tokyonight-theme, NvimTree
* Hyprland Setup (Alternatively, QTile)


## Imperative Configuration:
This section lists things to be done imperatively, as these systems are either in a highly volatile developing stage, rendering the declerative paradigm unreasonable (Zen), or simply too complex to bother (KDE).

* XDG-Directories
    * Immediately make all Home-Directories as specified in the custom user-dirs.dirs and remove already created user-dirs.dirs.home.orig files -> Otherwise, HomeManager likes to make backups and then crash, as it doesn't like to override already made backups.
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
    * Setup, Mods and Worlds - Giving Minecraft 16GB of RAM should be totally fine.
* Ghidra
    * Add [GBA-Loader](https://github.com/pudii/gba-ghidra-loader)

## Caveats
* User service plasma-kwallet-pam.service consistently fails as its functionality is implemented in /etc/profile. This should be irrelevant, but could lead to unexplained behaviour in Plasma.
* In the current setup, TTY Environments cannot declare and save new passwords, only graphical interfaces can. After decleration and saving in kwallet, they are however available in the TTY as well. This is due to QT\_QPA\_ENVIRONMENT=offscreen (necessary for using kwallet in TTYs) misbehaving for new passwords. It is thus also not recommended to start graphical sessions in TTYs, as they will inherit this environmental variable and (probably) disable all QT-Applications (or the whole of Plasma).
* The official minecraft launcher is tagged as broken and nonfunctional, and Modrinth doesn't really work as well. The official nixos-wiki recommends Prismlauncher.
* Home-Manager likes to break .desktop-file-icons on the Plasma-Taskbar when rebuilding.
