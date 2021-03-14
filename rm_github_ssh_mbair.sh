#!/bin/bash

echo -e "ssh key for GitHub cleaning...\n"

# 削除する範囲の最初の行の抽出
row_num=$(grep "Sourcetree" -n ~/.ssh/config | cut -d ":" -f 1)
arr1=$(seq $row_num $(( $row_num+8 )))
# 配列のソート
arr2=($(echo "${arr1[@]}"|sort -nr))

# 最初の行+8を削除する
for i in ${arr2[@]}
do
  sed -i -e "${i}d" ~/.ssh/config
done

# 公開鍵、秘密鍵の削除
rm -rf ~/.ssh/keisuke-ito-lab-Github
rm -rf ~/.ssh/keisuke-ito-lab-Github.pub

echo "OK"
