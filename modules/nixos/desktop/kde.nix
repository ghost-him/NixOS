# modules/nixos/desktop/kde.nix
{ config, lib, pkgs, ... }:

{
  # 启用 X11 窗口系统，这是 Plasma 6 的基础（即使在 Wayland 下也需要 XWayland）
  services.xserver.enable = true;

  # 启用 KDE Plasma 6 桌面环境
  services.desktopManager.plasma6.enable = true;

  # 启用 SDDM 显示管理器
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # 为 SDDM 启用 Wayland 支持
  };

  # 放置一些与桌面环境核心功能或系统管理相关的软件包
  environment.systemPackages = with pkgs; [
    # XWayland 为 Wayland 会话提供 X11 兼容性
    xwayland
    # Wayland 实用工具
    wayland-utils
    # SDDM 配置模块，这是一个系统级的配置工具
    kdePackages.sddm-kcm
    # 分区管理器，通常作为系统工具使用
    kdePackages.partitionmanager
  ];
}