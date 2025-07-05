{ system }:

{
  df = "df -h";

  # Vim
  nano = "nvim";
  v = "nvim";
  vim = "nvim";
  vi = "nix run ~/.config/nvim/nixvim-config/";
  cfv = "cd ~/.config/nvim/nixvim-config";

  # Git
  ga = "git add";
  gc = "git commit";
  gd = "git diff";
  gg = "git pull";
  gp = "git push";
  gr = "git reset";
  gs = "git status";
} // (
  if system == "x86_64-linux" then {

    cf = "cd /etc/nixos/nix-config";
    ngc = "sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system old && nix-collect-garbage -d";
    rb = "sudo nixos-rebuild switch --flake /etc/nixos/nix-config";
    rbv = "sudo nix flake lock --update-input nixvim /etc/nixos/nix-config && sudo nixos-rebuild switch --flake /etc/nixos/nix-config"; # update nixvim and rebuild

  } else if system == "aarch64-darwin" then {

    cf = "cd ~/.config/nix-config";
    rb = "sudo darwin-rebuild switch --flake ~/.config/nix-config";
    rbv = "sudo nix flake lock --update-input nixvim ~/.config/nix-config && sudo darwin-rebuild switch --flake ~/.config/nix-config"; # update nixvim and rebuild

  } else { }
)


