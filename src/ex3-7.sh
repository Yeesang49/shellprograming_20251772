#!/bin/bash

# 1) 사용자 정보
show_user_info() {
    echo "===== 사용자 정보 ====="
    echo "현재 사용자 : $(whoami)"
    echo "호스트 이름 : $(hostname)"
    echo
    echo "[현재 로그인 중인 사용자들]"
    who
    echo "======================="
}

# 2) GPU 또는 CPU 사용률 확인
show_gpu_or_cpu_usage() {
    echo "===== GPU / CPU 사용률 ====="
    if command -v nvidia-smi >/dev/null 2>&1; then
        echo "[nvidia-smi 출력]"
        nvidia-smi
    else
        echo "[nvidia-smi 사용 불가 → CPU 사용률(top) 일부 출력]"
        # CPU 사용 포함 상위 몇 줄만 표시
        top -b -n 1 | head -n 10
    fi
    echo "============================"
}

# 3) 메모리 사용량 확인
show_memory_usage() {
    echo "===== 메모리 사용량 (free -h) ====="
    free -h
    echo "==================================="
}

# 4) 디스크 사용량 확인
show_disk_usage() {
    echo "===== 디스크 사용량 (df -h) ====="
    df -h
    echo "================================="
}

# 메인 루프
while true; do
    echo "=========================="
    echo "1) 사용자 정보"
    echo "2) GPU 또는 CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "q) 종료"
    echo "=========================="
    echo -n "메뉴 선택 (1-4, q): "
    read choice

    case "$choice" in
        1)
            show_user_info
            ;;
        2)
            show_gpu_or_cpu_usage
            ;;
        3)
            show_memory_usage
            ;;
        4)
            show_disk_usage
            ;;
        q|Q)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "1~4 또는 q 를 입력하세요."
            ;;
    esac

    echo    # 한 줄 공백
done
