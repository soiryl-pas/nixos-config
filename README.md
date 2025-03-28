# NixOS-Configuration

## TODOs

* Get locale correctly: LANG to en_GB.UTF-8, everything else to de_AT.UTF-8

* Neovim Config - If possible, configurable per devshell-flake
    * telescope, nvim-cmp, language servers, formatters, treesitter, tokyonight, NvimTree

* Implement all apps

## Caveats
* User service plasma-kwallet-pam.service consistently fails as its functionality is implemented in /etc/profile. This should be irrelevant, but could lead to unexplained behaviour in Plasma.

## Imperative Configuration:
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
