#!/bin/bash
# Lab 2 — promptfoo 실습 실행 스크립트
# 사용법: bash run.sh

if [ -z "$DEEPSEEK_API_KEY" ]; then
  read -p "DEEPSEEK_API_KEY 입력: " DEEPSEEK_API_KEY
fi

echo ""
echo "결과 UI: http://localhost:15500"
echo "종료: exit 입력 또는 Ctrl+D"
echo ""

docker run --rm -it \
  -p 15500:15500 \
  -e DEEPSEEK_API_KEY="$DEEPSEEK_API_KEY" \
  ws02-lab2
