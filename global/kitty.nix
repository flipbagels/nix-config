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
    themeFile = "Corvine";
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
      map ctrl+shift+h neighboring_window left
      map ctrl+shift+j neighboring_window down
      map ctrl+shift+k neighboring_window up
      map ctrl+shift+l neighboring_window left

    "
    + darwinExtraConfig;
  };
}
