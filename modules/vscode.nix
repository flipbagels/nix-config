{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;
    mutableExtensionsDir = false;

    extensions = pkgs-unstable.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "tokyo-night";
        publisher = "enkia";
        version = "1.0.9";
        sha256 = "2EphqiRVFw5cHAfCS+wscUM5eR48W9y96LJZQH4k0l4=";
      }
      # {
      #   name = "houston";
      #   publisher = "astro-build";
      #   version = "0.1.2";
      #   sha256 = "Xs39Sgrvo20MVXCDet14qsQ9adSfbGrKyMUp6AV1YVk=";
      # }
      # {
      #   name = "theme-vitesse";
      #   publisher = "antfu";
      #   version = "0.8.3";
      #   sha256 = "KkpJgJBcnMeQ1G97QS/E6GY4/p9ebZRaA5pUXPd9JB0=";
      # }
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.29.0";
        sha256 = "J3V8SZJZ2LSL8QfdoOtHI1ZDmGDVerTRYP4NZU17SeQ=";
      }
      {
        name = "nix";
        publisher = "bbenoist"; 
        version = "1.0.1";
        sha256 = "qwxqOGublQeVP2qrLF94ndX/Be9oZOn+ZMCFX1yyoH0=";
      }
      {
        name = "lua";
        publisher = "sumneko";
        version = "3.13.5";
        sha256 = "WKgVHkpY6xjPXcgKl3V4D4tmb2W+1+IN3gedHZ5SRuU=";
      }
      {
        name = "even-better-toml";
        publisher = "tamasfe";
        version = "0.21.2";
        sha256 = "IbjWavQoXu4x4hpEkvkhqzbf/NhZpn8RFdKTAnRlCAg=";
      }
      {
        name = "python";
        publisher = "ms-python";
        version = "2024.22.2";
        sha256 = "uVv4kpTf0W82Gvoju0Q/HKf6SpN2mwuYO7NItlRoezI=";
      }
      # {
      #   name = "vscode-pylance";
      #   publisher = "ms-python";
      #   version = "2024.12.1";
      #   sha256 = "LpHbXthVHvrVZ1xqBTDfF1RjzgEilQVVHfy0tlum/BU=";
      # }
      # {
      #   name = "debugpy";
      #   publisher = "ms-python";
      #   version = "2024.14.0";
      #   sha256 = "tGbfjv1ipnYbea5dgVCF0pE0wZ8zOV61MkL+DTsN0ls=";
      # }
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2024.11.0";
        sha256 = "BwZLF52ilEaLU6swUFEa+PtrxzsFOLIYd8TVD7xRgPg=";
      }
      {
        name = "rainbow-csv";
        publisher = "mechatroner";
        version = "3.14.0";
        sha256 = "yNX2l8s99ySP/g5IDQ1G5kk8X2ujxx+Lc91irHkqPqI=";
      }
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.116.1";
        sha256 = "onDOybZsYMZltaVDP70quvZ3pejPsc0qvM+e2aLisXQ=";
      }
      {
        name = "liveserver";
        publisher = "ritwickdey";
        version = "5.7.9";
        sha256 = "sha256-w0CYSEOdltwMFzm5ZhOxSrxqQ1y4+gLfB8L+EFFgzDc=";
      }
    ];

    # extensions = with pkgs.vscode-marketplace; [
    #   enkia.tokyo-night
    #   jnoortheen.nix-ide
    #   mechatroner.rainbow-csv
    #   ms-python.python
    #   ms-toolsai.jupyter
    #   ms-vscode-remote.remote-ssh
    #   sumneko.lua
    #   vscodevim.vim
    # ];

    userSettings = {
      "python.terminal.activateEnvironment" = false;
      "editor.lineNumbers" = "relative";
      "files.autoSave" = "afterDelay";
      "update.mode" = "none";
      "vim.useSystemClipboard" = true;
      "jupyter.askForKernelRestart" = false;
      "editor.minimap.enabled" = false;
      "workbench.colorTheme" = "Tokyo Night";
      # "workbench.colorTheme" = "Vitesse Dark";
      "editor.autoClosingBrackets" = "never";
      "editor.autoClosingComments" = "never";
      "editor.autoClosingDelete" = "never";
      "editor.autoClosingOvertype" = "never";
      "editor.autoClosingQuotes" = "never";
      "editor.autoSurround" = "never";
      "editor.acceptSuggestionOnEnter" =  "off";
      # "editor.tokenColorCustomizations" = {
      #   "[Houston]" = {
      #     "comments" = "#8e97a5e0";
      #   };
      # };
    };
  };
}

