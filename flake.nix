{
  description = "Someone0123-pas NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-24-11.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-24-11,
    home-manager,
    zen-browser,
    nix-alien,
    ...
  }: {
    nixosConfigurations.pas-nixos = 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-24-11 = import nixpkgs-24-11 { inherit system;
	config = { allowUnfree = true; };
      };
      specialArgs = { inherit inputs; inherit system; inherit pkgs-24-11; };
    in nixpkgs.lib.nixosSystem {
      inherit system;
      inherit specialArgs;
      modules = [
	./global

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
	  nixpkgs.config.permittedInsecurePackages = ["dotnet-sdk-6.0.428"];
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
  };
}
