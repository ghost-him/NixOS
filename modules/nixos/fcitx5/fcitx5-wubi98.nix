# /etc/nixos/fcitx5/fcitx5-wubi98.nix
{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "fcitx5-wubi98";
  version = "2025-06-10";
  src = ./wubi98-src;

  nativeBuildInputs = [ pkgs.libime pkgs.gnused ]; # gnused 提供了 sed 命令

  dontUnpack = true;
  
  installPhase = ''
    runHook preInstall

    # 1. 创建目录
    install -d $out/share/libime
    install -d $out/share/fcitx5/inputmethod
    install -d $out/share/fcitx5/punctuation

    # 2. 切换到源目录
    cd $src

    # 3. 编译词典
    libime_tabledict ./txt/wubi98-single.txt $out/share/libime/wubi98-single.main.dict
    libime_tabledict ./txt/wubi98-pinyin.txt $out/share/libime/wubi98-pinyin.main.dict
    libime_tabledict ./txt/wubi98-large.txt $out/share/libime/wubi98-large.main.dict
    libime_tabledict ./txt/wubi98.txt $out/share/libime/wubi98.main.dict

    # 4. 复制配置文件和标点文件
    cp -r ./conf/* $out/share/fcitx5/inputmethod/
    cp -r ./bd/* $out/share/fcitx5/punctuation/

    # 5. 修改 .conf 文件中的 File 路径
    #    使用扩展正则表达式 (ERE) 更为健壮
    for conf_file in $out/share/fcitx5/inputmethod/*.conf; do
      # 确保文件确实存在并且是一个普通文件，以防万一
      if [ -f "$conf_file" ]; then
        echo "Processing $conf_file to update dict path..."
        # 使用 sed -E (ERE) 来匹配和替换
        # 将 "File=/usr/share/libime/somefile.dict" 修改为 "File=somefile.dict"
        sed -i -E "s|^File=/usr/share/libime/(.*)|File=$out/share/libime/\1|" "$conf_file"
      else
        echo "Warning: Expected conf file $conf_file not found or not a regular file."
      fi
    done

    runHook postInstall
  '';

  meta = with pkgs.lib; {
    description = "98 Wubi input method for Fcitx5";
    homepage = "http://98wb.ysepan.com/"; 
    license = licenses.unfree; 
    platforms = platforms.all;
  };
}