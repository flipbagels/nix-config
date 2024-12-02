# shell.nix
let
  # We pin to a specific nixpkgs commit for reproducibility.
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/cf8cc1201be8bc71b7cbbbdaf349b22f4f99c7ae.tar.gz") {};
in
pkgs.mkShell {
  buildInputs = [
    (pkgs.python3.withPackages (python-pkgs: [
      # select Python packages here
      
    ]))
  ];
}
