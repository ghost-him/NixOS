{ config, pkgs, ...}:

{
    fonts.packages = with pkgs; [
      maple-mono.NF-CN
      vista-fonts-chs
      cascadia-code
    ];
}