{

  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  imports = [
    ../../global/fonts.nix
    ../../nixos/global/hardware/lenovo-slim-7-14itl05.nix
    ../../nixos/global/sunshine.nix
  ] ++ [
    # ../../nixos/hyprland/system
    ../../nixos/gnome/system
  ];

  system.stateVersion = "24.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # User
  users.users.lukas = {
    isNormalUser = true;
    description = "Lukas";
    extraGroups = ["networkmanager" "wheel" "input" "uinput"];
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages =
    (with pkgs; [
      file
      gcc
      git
      gnumake
      kitty
      libsForQt5.xp-pen-g430-driver # XP-pen support
      sshfs
      unzip
      wget
      wl-clipboard
      zip
    ])
    ++ (with pkgs-unstable; [
      neovim
    ]);

  # Swap CAPS and ESC
  hardware.uinput.enable = true;
  services.kanata = {
    enable = true;
    keyboards.internal = {
      devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
      config = ''
        (defsrc esc caps)
        (deflayer base caps esc)
      '';
    };
  };

  # Networking
  networking = {
    hostName = "aqua";
    networkmanager = {
      enable = true;
    };
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Time zone
  time.timeZone = "Europe/London";

  # Internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # jack.enable = true;

    # media-session.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
}
