{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    theme = "Corvine";
    font = {
      name = "JetBrains Mono";
      size = 16;
    };
    extraConfig = "
      enabled_layouts horizontal

      # Mappings
      map ctrl+shift+n next_tab
      map ctrl+shift+p previous_tab
      map ctrl+h neighboring_window left
      map ctrl+j neighboring_window down
      map ctrl+k neighboring_window up
      map ctrl+l neighboring_window left
    ";
  };
}
