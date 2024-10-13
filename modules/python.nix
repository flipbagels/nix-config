{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ppkgs: with ppkgs; [
      jupyter
      matplotlib
      numpy
      pandas
      pip
      virtualenv
    ]))
  ];
}