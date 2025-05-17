{
  description = "Someone0123-pas NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-alien.url = "github:thiagokokada/nix-alien";

    # My own flakes with apps that need non-global dependencies
    #qt-custom.url = "./pas/shell/qt";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    zen-browser,
    nix-alien,
    ...
  }: {
    nixosConfigurations.pas-nixos = 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system;
	config = {
	  allowUnfree = true;
	  permittedInsecurePackages = ["dotnet-sdk-6.0.428"];
	};
      };
      specialArgs = { inherit inputs; inherit system; inherit pkgs; };
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
