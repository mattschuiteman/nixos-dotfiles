{ config, lib, pkgs, ...}:

{
    imports =
    [
    ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    services.getty.autologinUser = "matt";

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    time.timeZone = "America/LosAngeles";

    programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
        };

        users.users.matt = {
            isNormalUser = true;
            extraGroups = ["wheel"];
            packages = with pkgs; [
            tree
            ];
        };

        programs.firefox.enable = true;
        environment.systemPackages = with pkgs; [
        vim
        wget
        foot
        waybar
        kitty
        emacs
        git
        gcc
        hyprpaper
        ];

        nix.settings.experimental-features = ["nix-command" "flakes"];
        system.stateVersion = "25.05";

	services.openssh.enable = true;
	services.greetd = {
            enable = true;
            settings = {
                default_session = {
                   command = "start-hyprland";
                   user = "matt";
                };
            };
      };
}
