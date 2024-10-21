{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
    imports = [
      ./aerospace
      ../../modules/shell/zsh.nix
      ../../modules/git.nix
      ../../modules/kitty.nix
      ../../modules/python.nix
      ../../modules/rust.nix
      ../../modules/vscode.nix
    ];

  # Only include CLI tools here. GUI applications declared in system config so that they show up in spotlight search
  home.packages =
    (with pkgs; [
      gh
      openconnect
      ripgrep
    ])
    ++ (with pkgs-unstable; [
      aerospace
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
