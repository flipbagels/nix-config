{ config, pkgs, flake-inputs,  ... }:

{
  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        extensions = with flake-inputs.firefox-addons.packages."x86_64-linux"; [
          darkreader
          ublock-origin
          zotero-connector
        ];
        settings = {
          # Extension settings
          "extensions.autoDisableScopes" = 0;
          "extensions.pocket.enabled" = false;
        };
        extraConfig =
          # Configure which extensions are pinned to toolbar
          ''user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"ublock0_raymondhill_net-browser-action\",\"addon_darkreader_org-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"save-to-pocket-button\",\"downloads-button\",\"fxa-toolbar-menu-button\",\"unified-extensions-button\",\"zotero_chnm_gmu_edu-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"firefox-view-button\",\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"zotero_chnm_gmu_edu-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"addon_darkreader_org-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"toolbar-menubar\",\"TabsToolbar\",\"unified-extensions-area\"],\"currentVersion\":20,\"newElementCount\":3}");'';
      };
    };
  };
}