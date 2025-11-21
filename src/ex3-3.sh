#!/bin/bash

echo "점수들을 공백으로 구분해 2개 이상 입력하세요 (0~100 정수)."
echo "예시: 95 80 100 77"
echo -n "점수들 입력: "

read -a scores

if [ "${#scores[@]}" -lt 2 ]; then
    echo "최소 2개 이상의 점수를 입력해야 합니다."
    exit 1
fi

sum=0
idx=1

echo "======================"
echo "각 과목 점수 및 등급"
echo "======================"

for s in "${scores[@]}"; do
    # 정수인지 확인
    if ! [[ "$s" =~ ^[0-9]+$ ]]; then
        echo "[$s] 는 올바른 정수가 아니네요. (0~100 범위의 정수 필요)"
        exit 1
    fi

    # 0~100 범위 확인
    if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
        echo "[$s] 는 0~100 범위를 벗어났습니다."
        exit 1
    fi

    # 등급 결정
    if [ "$s" -ge 90 ]; then
        grade="A"
    else
        grade="B"
    fi

    echo "과목 $idx: 점수 = $s, 등급 = $grade"

    # 합계, 과목 인덱스 증가
    sum=$((sum + s))
    idx=$((idx + 1))
done

# 평균 점수 (정수 나눗셈)
count=${#scores[@]}
avg=$((sum / count))

# 평균 등급 계산: 평균 점수가 90 이상이면 A, 아니면 B
if [ "$avg" -ge 90 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "----------------------"
echo "총 과목 수 : $count"
echo "평균 점수 : $avg"
echo "평균 등급 : $avg_grade"
