#!/bin/bash

# 削除する範囲の最初の行の抽出
row_num=$(grep "Sourcetree" -n ~/.ssh/config | cut -d ":" -f 1)
row_str=$(grep "Sourcetree" -n ~/.ssh/config | cut -d ":" -f 2)
echo ${row_num}
echo ${row_str}

# 最初の行+8を削除する
d1=$(( $row_num+8 ))
d2=$(( $row_num+7 ))
d3=$(( $row_num+6 ))
d4=$(( $row_num+5 ))
d5=$(( $row_num+4 ))
d6=$(( $row_num+3 ))
d7=$(( $row_num+2 ))
d8=$(( $row_num+1 ))
d9=$row_num
sed -i -e "${d1}d" ~/.ssh/config
sed -i -e "${d2}d" ~/.ssh/config
sed -i -e "${d3}d" ~/.ssh/config
sed -i -e "${d4}d" ~/.ssh/config
sed -i -e "${d5}d" ~/.ssh/config
sed -i -e "${d6}d" ~/.ssh/config
sed -i -e "${d7}d" ~/.ssh/config
sed -i -e "${d8}d" ~/.ssh/config
sed -i -e "${d9}d" ~/.ssh/config

# 公開鍵、秘密鍵の削除
rm -rf ~/.ssh/keisuke-ito-GitHub
rm -rf ~/.ssh/keisuke-ito-GitHub.pub
