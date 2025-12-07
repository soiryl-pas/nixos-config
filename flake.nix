{
  description = "Soiryl-pas NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-24-11.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-25-05.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
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
    zen-browser,
    nix-alien,
    nixos-hardware,
    ...
  }: {
    nixosConfigurations.pas-magolor = 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-24-11 = import nixpkgs-24-11 { inherit system;
	config = { allowUnfree = true; };
      };
      pkgs-25-05 = import nixpkgs-25-05 { inherit system; };
      specialArgs = { inherit inputs; inherit system; inherit pkgs-24-11; inherit pkgs-25-05; };
    in nixpkgs.lib.nixosSystem {
      inherit system;
      inherit specialArgs;
      modules = [
	./pas-magolor

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
	  };
	  nixpkgs.config.allowUnfree = true;
	  nixpkgs.config.permittedInsecurePackages = ["dotnet-sdk-6.0.428" "dotnet-runtime-6.0.36"];
	}

	home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    backupFileExtension = "orig.home";
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
      pkgs-24-11 = import nixpkgs-24-11 {
        inherit system;
        config = { allowUnfree = true; };
      };
      specialArgs = { inherit inputs; inherit system; inherit pkgs-24-11; };
    in nixpkgs.lib.nixosSystem {
      inherit system;
      inherit specialArgs;
      modules = [
        ./pas-waddledee
        nixos-hardware.nixosModules.lenovo-thinkpad-p50

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
	  };
	  nixpkgs.config.allowUnfree = true;
	  nixpkgs.config.permittedInsecurePackages = ["dotnet-sdk-6.0.428" "dotnet-runtime-6.0.36"];
	}

	home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    backupFileExtension = "orig.home";
	    extraSpecialArgs = specialArgs;
	    users.pas = import ./pas-waddledee/home-manager-configuration.nix;
	  };
	}
      ];
    };
  };
}
