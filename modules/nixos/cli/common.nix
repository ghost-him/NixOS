{configs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        # 基本的编辑器
        neovim
        # 基本软件
        wget
        git
        curl
        tree
        which
        man
        # 监控软件
        btop
        iotop
        iftop
        fastfetch
        # 加解压缩包
        zstd
        zip
        unzip
        p7zip
        # 多窗口管理软件
        screen
    ];
}