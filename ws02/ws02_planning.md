# ws02 기획 문서
> security-workshop 2회차 준비 | 작성일: 2026-04-17

---

## 1. 프로젝트 컨텍스트

- **시리즈**: security-workshop (외부 강의)
- **이번 회차**: ws02 (2회차)
- **남은 기간**: 약 3주
- **대상**: 같은 기관, 새로운 참여자 (ws01과 다른 수강생), 15명
- **총 시간**: 8시간 (오전 강의 + 오후 실습)

---

## 2. ws01 피드백 (개선해야 할 점)

| 문제 | 원인 | ws02 개선 방향 |
|---|---|---|
| 자동화 툴 실습 장벽 | garak — Python 의존성, 설치 오류 많음 | promptfoo 추가 병행 (garak + promptfoo 둘 다 사용) |
| 실습 시간이 남음 | 콘텐츠 부족 | Gandalf CTF 추가로 실습량 증대 |
| 소극적 참여 | 비코더는 따라오기 어려움 | 브라우저 기반 CTF로 100% 참여 유도 |
| Rate limit 발생 | 수강생 개인 API key 사용 | LiteLLM proxy로 강사 key 중앙화 |

---

## 3. ws01 구조 (참고용)

- **오전**: 강의
- **오후**: 실습 (ipynb 3개)
- ws01 실습 파일: `security-workshop/ws01/` 폴더에 ipynb 3개

> ⚠️ ws02 기획은 ws01 ipynb 파일을 직접 확인한 후 재구성 필요
> → ws01 파일을 열어서 각 notebook의 주제/구성 파악 후 ws02 설계

---

## 4. ws02 확정 조건

### 강의 구조
- **오전**: 강의 (ws01과 동일 방식)
- **오후**: 실습 4시간 30분
- **실습 형태**: ipynb 3개 (ws01 포맷 유지)

### 주제
- LLM 보안 전반 (ws01과 동일 범위, 새로운 참여자 기준)

### 실습 툴
- **Gandalf CTF** (gandalf.lakera.ai) — 브라우저 기반, 설치 없음
- **garak** — Python 기반 LLM 레드팀 스캐너 (ws01 사용 툴)
- **promptfoo** — YAML 기반 자동화 스캐너 (garak과 병행)
- **API**: Gemini 유지

### 인프라
- **LiteLLM proxy**: 강사 노트북에서 실행, 수강생은 같은 와이파이로 접속
  ```
  수강생 노트북 15대
        ↓ (같은 와이파이)
   강사 노트북 (LiteLLM proxy)
        ↓
   Gemini API (강사 key)
  ```
- 환경: 로컬 설치 가능

---

## 5. ws02 실습 구조 (가안)

ws01 ipynb 파일 확인 후 확정 예정. 현재 방향:

```
nb01 — 환경 설정 + 워밍업          (30분)
       LiteLLM proxy 연결 확인
       간단한 API 호출 테스트
       Prompt Injection 개념 복습

nb02 — Gandalf CTF                 (90분)
       gandalf.lakera.ai 접속
       레벨별 힌트 + 토론 포인트 제공
       목표: Level 4~5 클리어
       "왜 이 방어가 뚫렸는가" 토론

nb03 — garak + promptfoo 자동화 스캐닝  (150분)
       [garak 파트]
       설치: pip install garak
       기본 프로브 실행 → JSONL 결과 확인
       ws01 복습 + 심화 프로브 시도

       [promptfoo 파트]
       설치: npx promptfoo@latest
       YAML 설정 (LiteLLM proxy 타겟)
       기본 스캔 실행 → 웹 리포트 확인
       YAML 수정 미션 (난이도별)

       [비교 wrap-up]
       두 툴 결과 비교 + 방어 관점 토론

총                                  270분 (4h 30m)
```

---

## 6. 툴 선택 근거

### garak + promptfoo 병행 이유
- garak은 NVIDIA가 유지보수 중 (활성 프로젝트), ws01에서 이미 사용한 친숙한 툴
- promptfoo를 추가하여 두 툴의 접근 방식 차이를 비교 체험
- ws01의 garak 설치 장벽 → LiteLLM proxy 환경에서 재시도, 병행 운영

| | garak | promptfoo |
|---|---|---|
| 설치 | pip (Python 필수) | npx (Node.js) |
| 설정 | CLI + Python 코드 | YAML 파일 |
| 결과 리포트 | JSONL (읽기 어려움) | 웹 UI 자동 생성 |
| 비코더 친화성 | 낮음 | 높음 |
| 워크샵 적합성 | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 교육적 가치 | 실전 도구 체험 | 직관적 리포트 분석 |

### Gandalf CTF 추가 이유
- 브라우저만으로 즉시 참여 가능 (설치 없음)
- 게임 형식 → 비코더도 자연스럽게 참여
- 레벨별 방어 강화 구조 → "공격/방어" 개념을 체험으로 습득
- 1회차 "소극적 참여" 문제 직접 해결

---

## 7. 다음 할 일 (우선순위 순)

1. **ws01 ipynb 3개 파일 내용 파악** → ws02 nb 구성 확정
2. **LiteLLM proxy 설정 테스트** → 수강생 연결 프로세스 완성
3. **nb01 제작** (환경 설정)
4. **nb02 제작** (Gandalf CTF 가이드)
5. **nb03 제작** (promptfoo 실습)
6. **강의 자료 (오전)** 제작

---

## 8. 미결 사항

- [ ] ws01 ipynb 내용 확인 후 nb 구성 재설계
- [ ] garak + promptfoo 병행 구성 세부 설계 (시간 배분, 순서 확정)
- [ ] Gandalf CTF를 nb02에서 어떻게 담을지 (브라우저 CTF + ipynb 가이드북 구조)
- [ ] 오전 강의 슬라이드 구성 (ws01 슬라이드 참고 필요)
