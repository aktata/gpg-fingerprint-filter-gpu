#!/usr/bin/env bash

set -e

# 固定参数值
KEY_COUNT=100
ALGO=ed25519
OUTPUT_FOLDER=/root/autodl-tmp/gpg

# 创建输出文件夹
mkdir -p $OUTPUT_FOLDER > /dev/null 2>&1

# 生成密钥
for i in `seq 1 $KEY_COUNT`; do
    ./gpg-fingerprint-filter-gpu \
        -a $ALGO \
        -t 63115200 \
        "(A{12,16}|B{12,16}|C{12,16}|D{12,16}|E{12,16}|F{12,16}|0{12,16}|1{12,16}|2{12,16}|3{12,16}|4{12,16}|5{12,16}|6{12,16}|7{12,16}|8{12,16}|9{12,16})$" \
        $OUTPUT_FOLDER/

    # 防止Ctrl+C中断
    sleep 0.5
done
