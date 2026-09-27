{
    description = "Hyprland on Nixos";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            };
    };

    outputs = { self, nixpkgs, home-manager, ...}: {
        nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
            modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.matt = import ./home.nix;
                    backupFileExtension = "backup";
                };
            }
            ];
        };
    };
}
