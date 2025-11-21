#!/bin/bash

echo "y = 1/2 * x^2 값을 계산합니다."
echo "x 값들을 공백으로 구분해서 2개 이상 입력하세요."
echo "예시: 1 2.5 -3 0.7"
echo -n "x 값들 입력: "

read -a xs #입력 받기

# 각 x에 대해 y = 1/2 * x^2 계산
for x in "${xs[@]}"; do
    y=$(echo "0.5 * $x * $x")
    echo "y = 1/2 * $x^2 = $y"
done
