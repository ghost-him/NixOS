# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
  
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/fcitx5/default.nix
      ../../modules/nixos/desktop/kde.nix
      ../../modules/nixos/fonts/default.nix
      ../../modules/nixos/proxy/v2ray.nix
      ../../modules/nixos/cli/common.nix
      ../../modules/nixos/cli/dev.nix

    ];

  #substituters mirrors
  nix.settings = {
    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  # 将硬件时钟设置为本地时间，以便与Windows兼容
  time.hardwareClockInLocalTime = true; 

  hardware.enableRedistributableFirmware = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8";


  nixpkgs.config.allowUnfree = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.ghost-him = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "networkmanager"]; # Enable ‘sudo’ for the user.
  };

    system.stateVersion = "25.05"; # Did you read the comment?
}


