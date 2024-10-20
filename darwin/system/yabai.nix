{ config, pkgs, ... }:

{
  services.yabai = {
    enable = true;
    config = {
      # Gaps
      layout = "bsp";

      # Window gaps
      window_gap = 5;
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;

      auto_balance = "off";

      # Mouse actions
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";

      focus_follows_mouse = "autofocus";

      window_shadow = "float";

      # Opacity
      window_opacity = "on";
      active_window_opacity = "0.85";
      normal_window_opacity = "0.85";
       
    };
  };
}
