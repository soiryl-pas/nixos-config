# NixOS-Configuration

## TODOs

* Implement all apps

* Neovim Config - If possible, configurable per devshell-flake
    * telescope, nvim-cmp, language servers, formatters, treesitter, tokyonight-theme, NvimTree

* Hyprland Setup (Alternatively, QTile)

## Imperative Configuration:
This section lists things to be done imperatively, as these systems are either in a highly volatile developing stage, rendering the declerative paradigm unreasonable (Zen), or simply too complex to bother (KDE).

* Plasma:
    * Theme to Breezedark
    * Panel Position to Right and Size 50
    * Clock to ISO Date
    * clickItemTo open
    * Locale
* Dolphin:
    * Theme: Green
    * Make Location Bar Editable, Show Full Path
    * Remember Display Style for Each Directory
    * Date Style: Absolute
    * Panel: Use Condensed Date
    * Show on Startup: Home-Directory
* Zen:
    * All Settings, especially Keyboard Shortcuts, Look and Feel, Search, Security

## Caveats
* User service plasma-kwallet-pam.service consistently fails as its functionality is implemented in /etc/profile. This should be irrelevant, but could lead to unexplained behaviour in Plasma.
