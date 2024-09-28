{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
  ];

  home.sessionVariables = {
    RUSTUP_TOOLCHAIN = "stable";
  };
}
