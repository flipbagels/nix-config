{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
    imports = [
      ./aerospace
      ../../global/shell
      ../../global/git.nix
      ../../global/julia.nix
      ../../global/kitty.nix
      ../../global/python.nix
      ../../global/rust.nix
      ../../global/vscode.nix
    ];

  # Only include CLI tools here. GUI applications declared in system config so that they show up in spotlight search
  home.packages =
    (with pkgs; [
      gh
      openconnect
      ripgrep
      (haskellPackages.ghcWithPackages (p: [ p.tidal ]))
    ])
    ++ (with pkgs-unstable; [
      aerospace
    ])
    ++ [
      inputs.nixvim.packages.aarch64-darwin.default
    ];

  home.username = "seierl";
  home.homeDirectory = "/Users/seierl";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
