{
  config,
  pkgs,
  system,
  ...
}:

let
  darwinExtraConfig = if system == "aarch64-darwin" then ''
    # Darwin specific config
    hide_window_decorations titlebar-only
  '' else "";
in {
  programs.kitty = {
    enable = true;
    theme = "Corvine";
    font = {
      name = "JetBrains Mono";
      size = 16;
    };
    extraConfig = "
      enabled_layouts horizontal, vertical

      # Mappings
      map ctrl+shift+/ next_layout
      map ctrl+shift+n next_tab
      map ctrl+shift+p previous_tab
      map ctrl+h neighboring_window left
      map ctrl+j neighboring_window down
      map ctrl+k neighboring_window up
      map ctrl+l neighboring_window left

    "
    + darwinExtraConfig;
  };
}
