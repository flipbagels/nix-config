{ config, pkgs, ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "firefox.desktop";
    };
  };
}
