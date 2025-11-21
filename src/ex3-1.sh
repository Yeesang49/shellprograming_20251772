#!/bin/bash

# 파라메터 변수
num1=$1
num2=$2

sum=$(( num1 + num2 ))
sub=$(( num1 - num2 ))
mul=$(( num1 * num2 ))

echo "첫 번째 숫자: $num1"
echo "두 번째 숫자: $num2"
echo "덧셈: $num1 + $num2 = $sum"
echo "뺄셈: $num1 - $num2 = $sub"
echo "곱셈: $num1 * $num2 = $mul"

# 0 나누기 처리
if [ "$num2" == 0 ]; then
    echo "나눗셈: 0으로 나눌 수 없습니다."
else
    div=$(( num1 / num2 ))   # 정수 나눗셈 (소수점 버려짐)
    echo "나눗셈: $num1 / $num2 = $div"
fi
