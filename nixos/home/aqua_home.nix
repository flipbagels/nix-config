{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  imports = [
    ../../global/shell
    ../../global/firefox.nix
    ../../global/git.nix
    # ../../modules/gtk.nix
    # ../../global/kitty.nix
    ../../global/python.nix
    ../../global/rust.nix
    # ../../global/vscode.nix
    ../gui/xdg.nix
  ] ++ [
    # ../../modules/hyprland
    ../gui/gnome/gnome.nix
  ];

  home.packages =
    (with pkgs; [
      discord
      gh
      gimp
      kitty
      # libreoffice
      # okular
      openconnect
      ripgrep
      slack
      spotify
      teams-for-linux
      # wineWowPackages.waylandFull
      zoom-us
      zotero_7
    ])
    ++ (with pkgs-unstable; [
      yazi
    ])
    ++ [
      inputs.nixvim.packages.x86_64-linux.default
    ];

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
