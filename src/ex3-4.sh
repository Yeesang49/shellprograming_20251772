#!/bin/bash
scores=()
# 평균 점수
calc_average() {
    if [ ${#scores[@]} -eq 0 ]; then
        echo "입력된 점수가 없습니다."
        return 1
    fi

    local sum=0
    for s in "${scores[@]}"; do
        sum=$((sum + s))
    done
    local count=${#scores[@]}
    local avg=$((sum / count))   # 정수 평균
    echo "$avg"
    return 0
}

# 평균 점수를 GPA로 변환
# 90이상: A (4.0)  80이상: B (3.0)
# 70이상: C (2.0)  60이상: D (1.0)
# 그 외: F (0.0)
convert_gpa() {
    local avg=$1
    local grade=""
    local gpa=""

    if ((avg >= 90)); then
        grade="A"
        gpa="4.0"
    elif ((avg >= 80)); then
        grade="B"
        gpa="3.0"
    elif ((avg >= 70)); then
        grade="C"
        gpa="2.0"
    elif ((avg >= 60)); then
        grade="D"
        gpa="1.0"
    else
        grade="F"
        gpa="0.0"
    fi

    echo "평균 등급: $grade (GPA: $gpa)"
}

while true; do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="
    echo -n "메뉴 선택 (1-5): "
    read choice

    case "$choice" in
        1)
            echo -n "추가할 과목 점수 입력 (0~100 정수): "
            read score

            # 정수인지 확인
            if ! [[ "$score" =~ ^[0-9]+$ ]]; then
                echo "⚠ 올바른 정수를 입력하세요."
                continue
            fi

            # 범위 확인
            if [ "$score" -lt 0 ] || [ "$score" -gt 100 ]; then
                echo "⚠ 점수는 0~100 사이여야 합니다."
                continue
            fi

            scores+=("$score")
            echo "점수 $score 가 추가되었습니다."
            ;;

        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "아직 입력된 점수가 없습니다."
            else
                echo "입력된 모든 점수:"
                idx=1
                for s in "${scores[@]}"; do
                    echo "과목 $idx: $s 점"
                    idx=$((idx + 1))
                done
            fi
            ;;

        3)
            avg=$(calc_average)
            if [ $? -eq 0 ]; then
                echo "평균 점수: $avg"
            fi
            ;;

        4)
            avg=$(calc_average)
            if [ $? -eq 0 ]; then
                echo "평균 점수: $avg"
                convert_gpa "$avg"
            fi
            ;;

        5)
            echo "프로그램을 종료합니다."
            break
            ;;

        *)
            echo "⚠ 1~5 사이의 번호만 입력하세요."
            ;;
    esac

    echo    # 한 줄 공백
done
