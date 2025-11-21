#!/bin/bash

DB_FILE="DB.txt"   # 데이터베이스 파일

[ -f "$DB_FILE" ] || touch "$DB_FILE"

while true; do
    echo "==================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "==================="
    echo -n "메뉴 선택 (1-5): "
    read choice

    case "$choice" in
        1)
            echo -n "이름: "
            read name
            echo -n "생일: "
            read birthday
            echo -n "전화번호: "
            read phone
            echo "MEMBER|$name|$birthday|$phone" >> "$DB_FILE"
            echo "팀원 정보 저장됨."
            ;;

        2)
            echo -n "날짜: "
            read date
            echo -n "활동: "
            read -r work
            echo "WORK|$date|$work" >> "$DB_FILE"
            echo "수행 내용 저장됨."
            ;;

        3)
            echo -n "검색할 팀원 이름: "
            read search_name
            result=$(grep "^MEMBER|" "$DB_FILE" | grep "$search_name")
            if [ -z "$result" ]; then
                echo "해당 이름의 팀원 정보가 없습니다."
            else
                echo "검색 결과:"
                echo "$result"
            fi
            ;;

        4)
            echo -n "검색할 날짜(예: 2025-11-21): "
            read search_date
            result=$(grep "^WORK|" "$DB_FILE" | grep "$search_date")
            if [ -z "$result" ]; then
                echo "해당 날짜의 수행 내용이 없습니다."
            else
                echo "검색 결과:"
                echo "$result"
            fi
            ;;

        5)
            echo "프로그램을 종료합니다."
            break
            ;;

        *)
            echo "1~5 중에서 선택하세요."
            ;;
    esac

    echo
done
