{
  description = "VM Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations.pas-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./global

	# Custom Settings
	{
	  custom = {
	    defaultDisplayManager = "greetd";
	  };
	}

	home-manager.nixosModules.home-manager {
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    backupFileExtension = "orig.home";
	    users.pas = import ./pas;
	  };
	}
      ];
    };
  };
}
