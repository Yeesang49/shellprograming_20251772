#!/usr/bin/env python3
import sys

print("실행파일 시작")
args=sys.argv[1:]
if len(args)<2:
	print("최소 2개 이상의 인자 입력")
	sys.exit(1)

for i in range(len(args)):
	print(args[i])

print("실행파일 끝")
