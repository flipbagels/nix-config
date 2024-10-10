{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  gui,
  ...
}: {
  imports = [
    ./bash
    ./firefox.nix
    ./git.nix
    # ./gtk.nix
    ./kitty.nix
    ./python.nix
    ./rust.nix
    ./vscode.nix
    ./xdg.nix
  ] ++ [
    ./hyprland
    ./gnome.nix
  ];

  home.packages =
    (with pkgs; [
      deskreen
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
