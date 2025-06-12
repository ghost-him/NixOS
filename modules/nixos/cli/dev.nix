{configs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        # C++ 相关
        gcc
        gdb
        valgrind
        cmake
        ninja

        # rust
        rustc
        cargo
    ];
}