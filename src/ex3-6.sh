#!/bin/bash
echo "파이썬 실행파일 실행"

SCRIPT_DIR="%(dirname "0")"
python3 "ex3-6.py" "$@"

echo "파이썬 실행파일 종료"
