#!/bin/bash

# 현재 작업 디렉터리 절대 경로
BASE_DIR="$(pwd)"

echo "현재 경로: $BASE_DIR"
# 1) DB 폴더 확인 및 생성
if [ -d "$BASE_DIR/DB" ]; then
    echo "[1] DB 폴더가 이미 존재합니다."
else
    echo "[1] DB 폴더가 없으므로 새로 생성합니다."
    mkdir "$BASE_DIR/DB"
fi

# 2) DB 폴더에 임의의 5개 파일 생성 후 압축

echo "[2] DB 폴더 안에 5개의 파일을 생성합니다."

for i in {1..5}; do
    file="$BASE_DIR/DB/file$i.txt"
    echo "이 파일은 file$i.txt 입니다." > "$file"
    echo " - 생성: $file"
done

# 5개 파일을 압축 (현재 폴더에 db_files.tar.gz 생성)
echo "[2] 5개 파일을 압축합니다. (db_files.tar.gz)"
tar -czf "$BASE_DIR/db_files.tar.gz" -C "$BASE_DIR/DB" file1.txt file2.txt file3.txt file4.txt file5.txt

# 3) train 폴더 생성 및 링크 생성
if [ -d "$BASE_DIR/train" ]; then
    echo "[3] train 폴더가 이미 존재합니다."
else
    echo "[3] train 폴더를 새로 생성합니다."
    mkdir "$BASE_DIR/train"
fi

echo "[3] train 폴더 안에 DB의 5개 파일로 가는 심볼릭 링크 생성."

for i in {1..5}; do
    target="$BASE_DIR/DB/file$i.txt"      # 실제 파일
    link="$BASE_DIR/train/file$i.txt"     # 링크 이름

    ln -sf "$target" "$link"
    echo " - 링크 생성: $link -> $target"
done
