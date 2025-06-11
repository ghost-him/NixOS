
{ config, lib, pkgs, ... }:

let wubi98 = pkgs.callPackage ./fcitx5-wubi98.nix {};
in
{
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-chinese-addons
        libsForQt5.fcitx5-qt
        fcitx5-gtk
        fcitx5-pinyin-zhwiki
        wubi98 
        #fcitx5-table-extra
      ];
    };
}