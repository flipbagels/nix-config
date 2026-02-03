{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ppkgs: with ppkgs; [
      ipykernel
      ipython
      jupyter
      matplotlib
      numpy
      pandas
      pip
      virtualenv
    ]))
  ];
}
