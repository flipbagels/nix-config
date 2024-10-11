{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
#  imports = [
#    ./bash
#    ./firefox.nix
#    ./git.nix
#    ./kitty.nix
#    ./python.nix
#    ./rust.nix
#    ./vscode.nix
#  ];

  home.packages =
    (with pkgs; [
      gh
      kitty
      openconnect
      ripgrep
    ])
    ++ (with pkgs-unstable; [
      yazi
    ])
    ++ [
      inputs.nixvim.packages.aarch64-darwin.default
    ];

  home.username = "seierl";
  home.homeDirectory = "/Users/seierl";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
