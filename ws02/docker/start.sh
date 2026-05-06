#!/bin/bash
# Lab 2 실습 시작 스크립트

if [ -z "$DEEPSEEK_API_KEY" ]; then
  echo "❌  DEEPSEEK_API_KEY 가 설정되지 않았습니다."
  echo "    docker run -e DEEPSEEK_API_KEY=sk-... 형식으로 실행하세요."
  exit 1
fi

mkdir -p /workspace/results

cat <<'EOF'

╔══════════════════════════════════════════╗
║  Lab 2 — promptfoo 자동화 보안 스캐닝   ║
╚══════════════════════════════════════════╝

📋  Step 1 — eval (CLI 실행 → UI 결과 확인)
    promptfoo eval -c configs/eval_config.yaml
    promptfoo view --yes
    → 브라우저: http://localhost:15500

✏️   Step 2 — YAML 수정 미션
    nano configs/eval_config.yaml
    promptfoo eval -c configs/eval_config.yaml      # 재실행

🔴  Step 3 — redteam (UI 풀 사용, 미리 로드됨)
    promptfoo redteam setup configs/redteam_config.yaml
    → 브라우저가 자동으로 열림 (config 미리 채워진 상태)
    → UI에서 plugin/strategy 조정 후 'Run' 클릭

────────────────────────────────────────────
종료: exit 또는 Ctrl+D

EOF

exec /bin/bash
