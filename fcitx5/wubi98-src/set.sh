#!/bin/bash

rm -rf ./dict/wubi98*

libime_tabledict ./txt/wubi98-single.txt ./dict/wubi98-single.main.dict
libime_tabledict ./txt/wubi98-pinyin.txt ./dict/wubi98-pinyin.main.dict
libime_tabledict ./txt/wubi98-large.txt ./dict/wubi98-large.main.dict
libime_tabledict ./txt/wubi98.txt ./dict/wubi98.main.dict

sudo cp -rf ./dict/*.dict /usr/share/libime
sudo cp -rf ./conf/*.conf /usr/share/fcitx5/inputmethod
sudo cp -rf ./bd/punc.mb.zh_CN /usr/share/fcitx5/punctuation

if [ ! -d ~/.config/fcitx5/table ]; then
  mkdir ~/.config/fcitx5/table
fi
sudo cp -rf ./conf/*.conf ~/.config/fcitx5/table
sudo chmod -R 777 ~/.config/fcitx5/table
sudo chmod -R 777 /usr/share/libime/wubi98*.dict
echo "已成功为『fcitx』添加『98五笔』，请重启或注销系统一次后，在对应的设置面板中添加！"
