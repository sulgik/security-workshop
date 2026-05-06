# Lab 2 — promptfoo 자동화 보안 스캐닝

## 사전 준비

Docker가 설치되어 있어야 합니다.
```bash
docker --version
```

## 이미지 빌드 (최초 1회, 약 1~2분)

```bash
cd ws02/docker
docker build -t ws02-lab2 .
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

컨테이너가 시작되면 셸이 열립니다.

---

## 실습 순서

### Step 1 — eval 모드 (수동 테스트)
```bash
promptfoo eval -c configs/eval_config.yaml
```
→ 브라우저에서 **http://localhost:15500** 열기 → PASS/FAIL 확인

### Step 2 — YAML 수정 미션
```bash
nano configs/eval_config.yaml   # 테스트 케이스 수정
promptfoo eval -c configs/eval_config.yaml  # 재실행
```

### Step 3 — redteam 모드 (자동 공격 생성)
```bash
promptfoo redteam run -c configs/redteam_config.yaml
```
→ UI에서 자동 생성된 공격 페이로드와 결과 분석

---

## 종료

```bash
exit
```
