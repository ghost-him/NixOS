# modules/home-manager/kde.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # 之前在 home.nix 中的 KDE 应用程序，现在作为用户级安装在此模块中
    kdePackages.discover # 发现应用
    kdePackages.kcalc # 计算器
    kdePackages.kcharselect # 字符选择工具
    kdePackages.kcolorchooser # 颜色选择器
    kdePackages.kolourpaint # 绘图程序
    kdePackages.ksystemlog # 系统日志查看器
    kdiff3 # 文件/目录比较工具
    kdePackages.isoimagewriter # ISO 写入工具
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdePackages.partitionmanager # Optional Manage the disk devices, partitions and file systems on your computer
    hardinfo2 # System information and benchmarks for Linux systems
    haruna # Open source video player built with Qt/QML and libmpv
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
  ];
}