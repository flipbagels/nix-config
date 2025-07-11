{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./fonts.nix
    ../homebrew
    # ./skhd.nix
    # ./yabai.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # nixpkgs.overlays = [
  #   inputs.nix-vscode-extensions.overlays.default
  # ];

  environment.systemPackages =
    ( with pkgs; [
      ffmpeg
      git
      gh
      kitty
      mkalias
      monitorcontrol
      mutagen
      skhd
      sshfs
      tmux
      unnaturalscrollwheels
      wget
    ])
    ++ ( with pkgs-unstable; [
      aerospace
      betterdisplay
      neovim
      rectangle
      vscode
    ])
    ++ [
      inputs.nixvim.packages.aarch64-darwin.default
    ];

  system.defaults.CustomUserPreferences = {
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
    userKeyMapping = [
      { # Also map Escape to Caps
        HIDKeyboardModifierMappingSrc = 30064771113;
        HIDKeyboardModifierMappingDst = 30064771129;
      }
    ];
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      ApplePressAndHoldEnabled = false;
      KeyRepeat = 2;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
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

  # This line ensures that aliases are created for spotlight search for apps installed with nix
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
    while read -r src; do
      app_name=$(basename "$src")
      echo "copying $src" >&2
      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
    done
    '';

  system.activationScripts.activateSettings.text = ''
    # Avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh = {
    enable = true;
  };

  system.primaryUser = "seierl";
  users.users.seierl.home = "/Users/seierl";

  services.tailscale.enable = true;

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
