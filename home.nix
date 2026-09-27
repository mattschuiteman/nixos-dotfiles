{ config, pkgs, ...}:

{
    home.username = "matt";
    home.homeDirectory = "/home/matt";
    home.stateVersion = "25.05";
    programs.git = {
        enable = true;
        settings.user = {
            name = "Matthew Schuiteman";
            email = "matthewschuiteman@gmail.com";
        };
        settings = {
            core.editor = "vim";
        };
        settings.alias = {
            ci = "commit";
            co = "checkout";
            st = "status";
            ap = "add --patch";
        };
    };
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo i use nixos, btw";
        };
    };
    home.file.".config/hypr".source = ./config/hypr;
    home.file.".config/waybar".source = ./config/waybar;
    home.file.".config/foot".source = ./config/foot;
    home.packages = with pkgs; [
    emacs
    fastfetch
    ];
}
