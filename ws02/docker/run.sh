#!/bin/bash
# Lab 2 — promptfoo 실습 실행 스크립트
# 사용법: bash run.sh

set -e

# 스크립트 위치로 이동 (docker 디렉토리)
cd "$(dirname "$0")"

# ── 1. 이미지 존재 확인, 없으면 자동 빌드 ─────────────────
if ! docker image inspect ws02-lab2:latest &>/dev/null; then
  echo "📦  이미지 'ws02-lab2' 가 없습니다. 빌드를 시작합니다 (약 1~2분)..."
  echo ""
  docker build -t ws02-lab2 .
  echo ""
  echo "✓  빌드 완료"
  echo ""
fi

# ── 2. API 키 입력 ─────────────────────────────────────────
if [ -z "$DEEPSEEK_API_KEY" ]; then
  read -p "DEEPSEEK_API_KEY 입력: " DEEPSEEK_API_KEY
fi

echo ""
echo "결과 UI: http://localhost:15500"
echo "종료: exit 입력 또는 Ctrl+D"
echo ""

# ── 3. 컨테이너 실행 ───────────────────────────────────────
docker run --rm -it \
  -p 15500:15500 \
  -e DEEPSEEK_API_KEY="$DEEPSEEK_API_KEY" \
  ws02-lab2
