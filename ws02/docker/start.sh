#!/bin/bash
# Lab 2 실습 시작 스크립트

if [ -z "$DEEPSEEK_API_KEY" ]; then
  echo "❌  DEEPSEEK_API_KEY 가 설정되지 않았습니다."
  echo "    docker run -e DEEPSEEK_API_KEY=sk-... 형식으로 실행하세요."
  exit 1
fi

mkdir -p /workspace/results

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║  Lab 2 — promptfoo 자동화 보안 스캐닝   ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "  📋  Step 1: eval 실행"
echo "      promptfoo eval -c configs/eval_config.yaml"
echo ""
echo "  ✏️   Step 2: YAML 수정 미션"
echo "      nano configs/eval_config.yaml  (수정 후 Step 1 재실행)"
echo ""
echo "  🔴  Step 3: redteam 실행"
echo "      promptfoo redteam run -c configs/redteam_config.yaml"
echo ""
echo "  🌐  결과 UI: http://localhost:15500"
echo ""
echo "────────────────────────────────────────────"
echo "  [결과 UI 시작 중...]"

# 백그라운드에서 view 서버 시작
promptfoo view --port 15500 --yes &

echo "  ✓  http://localhost:15500 에서 확인하세요"
echo ""

# 인터랙티브 셸 진입
exec /bin/bash
