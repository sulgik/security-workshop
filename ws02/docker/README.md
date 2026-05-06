# Lab 2 — promptfoo 자동화 보안 스캐닝

## 사전 준비

Docker가 설치되어 있어야 합니다.
```bash
docker --version
```

## 실습 시작

**Mac / Linux:**
```bash
bash run.sh
```

**Windows:**
```bat
run.bat
```

이미지가 없으면 자동으로 빌드됩니다 (최초 1회, 약 1~2분).

---

## 실습 순서

### Step 1 — eval 모드 (CLI 실행 + UI 결과 확인)

미리 준비된 5개 보안 테스트 케이스를 실행:

```bash
promptfoo eval -c configs/eval_config.yaml
promptfoo view --yes
```

→ 브라우저에서 **http://localhost:15500** 에서 PASS/FAIL 확인

### Step 2 — YAML 수정 미션

```bash
nano configs/eval_config.yaml      # assertion 변경, 테스트 케이스 추가
promptfoo eval -c configs/eval_config.yaml
```

### Step 3 — redteam 모드 (UI 풀 사용)

미리 작성된 YAML을 UI에 로드해서 인터랙티브하게 조정 → 실행:

```bash
promptfoo redteam setup configs/redteam_config.yaml
```

→ 브라우저가 자동으로 열림 (provider, system prompt, plugins 미리 채워진 상태)
→ UI에서 plugin / strategy 추가/수정 후 **Run** 클릭
→ 결과 자동 표시

---

## 종료

```bash
exit
```

`--rm` 옵션으로 실행되어 컨테이너는 자동 정리됩니다. 재실행은 `bash run.sh` 만 다시 입력하면 됩니다 (빌드 단계는 이미 캐시됨).
