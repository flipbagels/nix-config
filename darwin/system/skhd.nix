{ config, pkgs, ...}:

{
  services.skhd = {
    enable = true;

    skhdConfig = ''
      shift + cmd - return : open -na "kitty"
      shift + cmd - e : open -a "Finder"
      shift + cmd - f : yabai -m window --toggle float

      shift + cmd - h : yabai -m window --focus west
      shift + cmd - l : yabai -m window --focus east
      shift + cmd - k : yabai -m window --focus north
      shift + cmd - j : yabai -m window --focus south

      cmd - 1 : yabai -m space --focus 1
      cmd - 2 : yabai -m space --focus 2
      cmd - 3 : yabai -m space --focus 3
      cmd - 4 : yabai -m space --focus 4
      cmd - 5 : yabai -m space --focus 5

      shift + cmd - 1 : yabai -m window --space 1
      shift + cmd - 2 : yabai -m window --space 2
      shift + cmd - 3 : yabai -m window --space 3
      shift + cmd - 4 : yabai -m window --space 4
      shift + cmd - 5 : yabai -m window --space 5
    '';
  };
}
