#!/bin/bash
# ============================================================
# ws02 LiteLLM Proxy 강사 시작 스크립트
# 실행: bash ws02/run_proxy.sh
# ============================================================

set -e

# ── 1. DeepSeek API 키 설정 ───────────────────────────────
# 아래 줄의 your-key-here 를 실제 키로 교체하세요
# 키 발급: https://platform.deepseek.com/api_keys
export DEEPSEEK_API_KEY="your-key-here"

if [ "$DEEPSEEK_API_KEY" = "your-key-here" ]; then
  echo "❌  DEEPSEEK_API_KEY 를 설정하세요 (run_proxy.sh 파일 수정)"
  exit 1
fi

# ── 2. litellm 위치 자동 탐색 ─────────────────────────────
if command -v litellm &>/dev/null; then
  LITELLM="litellm"
elif [ -f "$HOME/Library/Python/3.13/bin/litellm" ]; then
  LITELLM="$HOME/Library/Python/3.13/bin/litellm"
elif [ -f "$HOME/Library/Python/3.12/bin/litellm" ]; then
  LITELLM="$HOME/Library/Python/3.12/bin/litellm"
else
  echo "❌  litellm 이 없습니다. 아래 명령으로 설치하세요:"
  echo "    pip install 'litellm[proxy]'"
  exit 1
fi

# ── 3. 강사 IP 확인 ────────────────────────────────────────
echo ""
echo "================================================"
echo "  강사 노트북 IP 주소 (수강생에게 공지):"
ifconfig 2>/dev/null | grep "inet " | grep -v 127.0.0.1 | awk '{print "  →  " $2}'
echo ""
echo "  수강생 Colab 설정값:"
echo "  INSTRUCTOR_IP    = \"<위 IP 주소>\""
echo "  LITELLM_API_KEY  = \"sk-workshop-2025\""
echo "  MODEL_NAME       = \"deepseek-chat\""
echo "================================================"
echo ""

# ── 4. Proxy 실행 ──────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "[시작] LiteLLM proxy 포트 4000 에서 실행 중..."
echo "       종료: Ctrl+C"
echo ""
$LITELLM --config "$SCRIPT_DIR/litellm_config.yaml" --port 4000 --host 0.0.0.0
