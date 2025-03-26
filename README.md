# NixOS-Configuration

## TODOs

* Run Plasma Commands on Startup to ensure panel position, clock widget, dolphin theme, breezedark, clickItemTo open

* Remap Plasma CTRL+ALT+T to Kitty, if possible

* Neovim Config - If possible, configurable per devshell-flake
    * telescope, nvim-cmp, language servers, formatters, treesitter, tokyonight, NvimTree

* Implement all apps

## Caveats
* User service plasma-kwallet-pam.service consistently fails as its functionality is implemented in /etc/profile. This should be irrelevant, but could lead to unexplained behaviour in Plasma.
