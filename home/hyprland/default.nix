{ config, pkgs, ...}:

{
  imports = [
    ./fuzzel.nix
    # ./hyprpaper.nix
    ./waybar
  ];

  config = 
  let
    terminal = "kitty";
    fileManager = "thunar";
    menu = "fuzzel";
  in {
    programs.kitty.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        exec-once = [
          "waybar &"
          "swww-daemon"
          "swww img /etc/nixos/nixos-config/images/forest-road.jpg"
        ];
        monitor = ", preferred, 1920x1080@60, 1";
        env = [
          "CURSOR_SIZE, 24"
          "HYPRCURSOR_SIZE, 24"
        ];
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 3;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          resize_on_border = true; # Allow mouse dragging
          allow_tearing = false;
          layout = "dwindle";
        };
        decoration = {
          rounding = 10;
          active_opacity = 0.85;
          inactive_opacity= 0.85;
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
          blur = {
            enabled = true;
            size = 5;
            passes = 1;
          };
        };
        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 4, myBezier"
            "windowsOut, 1, 4, default, popin 80%"
            "border, 1, 4, default"
            "borderangle, 1, 4, default"
            "fade, 1, 4, default"
            "workspaces, 1, 5, default"
            "specialWorkspace, 1, 5, default, slidevert"
          ];
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        master.new_status = "inherit";
        misc = {
          force_default_wallpaper = 0;
        };
        input = {
          kb_layout = "gb";
          kb_variant = "";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad.natural_scroll = true;
        };
        gestures.workspace_swipe = true;
        bind = [
          "$SUPER, N, exec, ${terminal}"
          "SUPER, Q, killactive"
          # "$mainMod, X, exit"
          "SUPER, E, exec, ${fileManager}"
          "SUPER, F, togglefloating"
          "SUPER, M, exec, ${menu}"
          "SUPER, P, pseudo" # dwindle
          "SUPER, O, togglesplit"
          
          "SUPER, H, movefocus, l"
          "SUPER, L, movefocus, r"
          "SUPER, K, movefocus, u"
          "SUPER, J, movefocus, d"
          
          "SUPER, 1, workspace, 1"
          "SUPER, 2, workspace, 2"
          "SUPER, 3, workspace, 3"
          "SUPER, 4, workspace, 4"
          "SUPER, 5, workspace, 5"
          "SUPER, 6, workspace, 6"
          "SUPER, 7, workspace, 7"
          "SUPER, 8, workspace, 8"
          "SUPER, 9, workspace, 9"
          "SUPER, 0, workspace, 10"

          "SUPER SHIFT, 1, movetoworkspace, 1"
          "SUPER SHIFT, 2, movetoworkspace, 2"
          "SUPER SHIFT, 3, movetoworkspace, 3"
          "SUPER SHIFT, 4, movetoworkspace, 4"
          "SUPER SHIFT, 5, movetoworkspace, 5"
          "SUPER SHIFT, 6, movetoworkspace, 6"
          "SUPER SHIFT, 7, movetoworkspace, 7"
          "SUPER SHIFT, 8, movetoworkspace, 8"
          "SUPER SHIFT, 9, movetoworkspace, 9"
          "SUPER SHIFT, 0, movetoworkspace, 10"

          "SUPER, S, togglespecialworkspace, bottomSheet"
          "SUPER SHIFT, S, movetoworkspace, special:bottomSheet"

          "SUPER, mouse_down, workspace, e+1"
          "SUPER, mouse_up, workspace, e-1"
        ];
        bindm = [
          "SUPER, mouse:273, movewindow"
        ];
        bindel = [
          ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ];
        windowrulev2 = [
          "suppressevent maximize, class:.*"
        ];
      };
    };
  };
}
