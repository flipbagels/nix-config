{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./fonts.nix
    ../homebrew
    # ./skhd.nix
    # ./yabai.nix
  ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages =
    ( with pkgs; [
      discord
      git
      gh
      kitty
      mkalias
      skhd
      slack
      unnaturalscrollwheels
      wget
      yabai
    ])
    ++ ( with pkgs-unstable; [
      aerospace
      neovim
      vscode
    ])
    ++ [
      inputs.nixvim.packages.aarch64-darwin.default
    ];

  system.defaults.CustomUserPreferences = {
    "com.apple.dock".expose-group-by-app = true;  # Enable grouping of windows by application. Useful for aerospace tiling manager.
  };

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      ApplePressAndHoldEnabled = false;
      KeyRepeat = 2;
    };
    dock = {
      autohide = true;
      autohide-delay = 0.02;
      autohide-time-modifier = 0.5;
      expose-animation-duration = 0.5;
      launchanim = false;
      static-only = true;
      tilesize = 40;
      show-recents = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
    };
    screencapture.location = "~/Pictures/screenshots";
  };

  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
  pkgs.lib.mkForce ''
    # Set up applications.
    echo "setting up /Applications..." >&2
    rm -rf /Applications/Nix\ Apps
    mkdir -p /Applications/Nix\ Apps
    find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
    while read src; do
      app_name=$(basename "$src")
      echo "copying $src" >&2
      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
    done
    '';

  system.activationScripts.postUserActivation.text = ''
    # Avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  # Auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh = {
    enable = true;
  };

  users.users.seierl.home = "/Users/seierl";

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
