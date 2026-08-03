{
  description = "Soiryl-pas NixOS Configuration";

  inputs = {
    nixpkgs-24-11.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-25-05.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-24-11,
    nixpkgs-25-05,
    home-manager,
    nix-index-database,
    zen-browser,
    nix-alien,
    nixos-hardware,
    ...
  }: {
    nixosConfigurations.pas-magolor = 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-24-11 = import nixpkgs-24-11 { inherit system; config.allowUnfree = true; };
      pkgs-25-05 = import nixpkgs-25-05 { inherit system; };
      specialArgs = { inherit inputs system pkgs-24-11 pkgs-25-05; };
    in nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        ./pas-magolor
        nix-index-database.nixosModules.default

	# Flakes in Registry
	{
	  nix.registry = {
	    nixpkgs.flake = nixpkgs;
	    home-manager.flake = home-manager;
	    zen-browser.flake = zen-browser;
	    nix-alien.flake = nix-alien;
	  };
	}

	# Custom Settings
	{
	  custom = {
	    defaultDisplayManager = "greetd";
        with-niri = true;
	  };
	  nixpkgs.config.allowUnfree = true;
	}

	home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    backupFileExtension = "orig.home";
        overwriteBackup = true;
	    extraSpecialArgs = specialArgs;
	    users.pas = import ./pas;
	  };
	}
      ];
    };

    nixosConfigurations.pas-waddledee =
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-24-11 = import nixpkgs-24-11 { inherit system; config.allowUnfree = true; };
      specialArgs = { inherit inputs system pkgs-24-11; };
    in nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        ./pas-waddledee
        nixos-hardware.nixosModules.lenovo-thinkpad-p50
        nix-index-database.nixosModules.default

        # Flakes in Registry
	{
	  nix.registry = {
	    nixpkgs.flake = nixpkgs;
	    home-manager.flake = home-manager;
	    zen-browser.flake = zen-browser;
	    nix-alien.flake = nix-alien;
	  };
	}

	# Custom Settings
	{
	  custom = {
	    defaultDisplayManager = "greetd";
        with-niri = true;
	  };
	  nixpkgs.config.allowUnfree = true;
	}

	home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    backupFileExtension = "orig.home";
        overwriteBackup = true;
	    extraSpecialArgs = specialArgs;
	    users.pas = import ./pas-waddledee/home-manager-configuration.nix;
	  };
	}
      ];
    };

    nixosConfigurations.pas-whispywoods =
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      specialArgs = { inherit inputs system; };
    in nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        ./pas-whispywoods
        nixos-hardware.nixosModules.dell-latitude-5490
        nix-index-database.nixosModules.default

        # Flakes in registry
        {
          nix.registry = {
            nixpkgs.flake = nixpkgs;
            home-manager.flake = home-manager;
            zen-browser.flake = zen-browser;
            nix-alien.flake = nix-alien;
          };
        }

        # Custom Settings
        {
          custom = {
            defaultDisplayManager = "sddm";
          };
          nixpkgs.config.allowUnfree = true;
        }

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "orig.home";
            overwriteBackup = true;
            extraSpecialArgs = specialArgs;
            users.pas = import ./pas-whispywoods/home-manager-configuration.nix;
          };
        }
      ];
    };
  };
}
