{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-marketplace; [
      jnoortheen.nix-ide
      mechatroner.rainbow-csv
      ms-python.python
      ms-toolsai.jupyter
      ms-vscode-remote.remote-ssh
      sumneko.lua
      vscodevim.vim
    ];

    userSettings = {
      "editor.lineNumbers" = "relative";
      "files.autoSave" = "afterDelay";
      "update.mode" = "none";
      "vim.useSystemClipboard" = "true";
    };
  };
}

