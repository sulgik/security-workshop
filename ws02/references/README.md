# 📖 ws02 보안 용어집

> 강의·실습에 등장하는 핵심 용어 30선
>
> HTML 버전: [`index.html`](index.html) · 강사 가이드: [`../ws02_instructor_guide.md`](../ws02_instructor_guide.md)
>
> 💡 이 용어집은 계속 확장됩니다.

---

## 📌 핵심 약어

### RCE — Remote Code Execution (원격 코드 실행)
공격자가 원격에서 피해자 시스템에 임의의 코드/명령을 실행할 수 있는 취약점.
CVSS 9.0+ Critical 의 대부분이 RCE. LLM 보안에서 프롬프트 인젝션이 RCE 로 연결되는 순간 — "챗봇 오작동" 이 아닌 "개발자 머신 장악" 으로 격상. 관련: `LCE` 로컬 권한 필요 · `SSRF` 서버가 임의 URL 요청.

### CVSS — Common Vulnerability Scoring System
취약점 심각도를 0.0–10.0 점수로 표준화한 채점 체계 (v3.1 / v4.0).
등급: `0.1–3.9` Low · `4.0–6.9` Medium · `7.0–8.9` High · `9.0–10.0` Critical. 구성: Attack Vector / Complexity / Privileges / User Interaction / CIA Impact.

### CVE — Common Vulnerabilities and Exposures (공통 취약점 식별자)
공개된 보안 취약점에 부여되는 고유 ID (예: CVE-2025-53773).
MITRE 가 관리, NVD 에서 상세 조회. 형식: `CVE-{연도}-{일련번호}`.

### SSRF — Server-Side Request Forgery (서버측 요청 위조)
공격자가 서버를 속여 내부망/임의 URL 로 요청을 보내게 만드는 공격.
LLM 이 외부 URL 을 fetch 하는 도구가 있으면 새 공격 표면. 내부 메타데이터 서버 (AWS IMDS) 조회로 자격증명 유출.

---

## 🤖 LLM 기본

### LLM — Large Language Model (대형 언어 모델)
방대한 텍스트 코퍼스로 사전학습된 Transformer 기반 신경망. GPT-4, Claude, Gemini, Llama 등. 다음 토큰 예측이 본질 — 통계적 패턴 매칭. 이것이 환각·인젝션의 근원.

### System Prompt (시스템 프롬프트)
LLM 에 미리 주입되는 역할·지시·제약 — 챗봇의 "성격" 과 "규칙".
사용자 입력 앞단에 자동 삽입. **LLM 에게는 사용자 입력과 동등한 토큰** — 공격자가 우회 시도. `LLM07` 유출.

### Context Window (컨텍스트 윈도우)
LLM 이 한 번에 처리하는 토큰 범위 (예: 128K, 1M).
시스템 프롬프트 / 사용자 입력 / RAG 문서 / 대화 이력이 **구분 없이 한 스트림** 으로 들어감 — 인젝션의 구조적 원인.

### Token (토큰 / Tokenization)
텍스트를 LLM 이 처리 가능한 단위(서브워드)로 잘게 나눈 조각.
영어 1 단어 ≈ 1.3 토큰 · 한국어 1 글자 ≈ 1.5–3 토큰. 비용·길이 제한·Rate Limit 의 기본 단위.

### Embedding (임베딩)
텍스트·이미지를 의미를 보존하는 고차원 벡터(예: 768·1024 차원) 로 변환.
벡터 간 코사인 유사도 = 의미 유사도. **역추출 공격** 으로 원문 재구성 가능 (Jina 데모).

### RAG — Retrieval-Augmented Generation (검색 증강 생성)
사용자 질문으로 외부 지식베이스를 검색한 결과를 LLM 컨텍스트에 주입하는 패턴.
구조: 질의 → 임베딩 → 벡터DB 검색 → 결과 결합 → LLM 응답. 새 공격 표면: 문서 오염 · 임베딩 역추출 · 권한 우회 (`LLM08`).

### Hallucination (환각)
LLM 이 사실이 아닌 내용을 자신있게 생성하는 현상 (`LLM09`).
"틀렸다는 걸 AI 자신도 모름". 사례: Mata v. Avianca · Air Canada 챗봇. **인간 검증이 유일한 답**.

### Fine-tuning / RLHF (미세조정 / 인간 피드백 강화학습)
사전학습 모델을 도메인·작업·정렬을 위해 추가 학습하는 단계.
`SFT` Supervised · `RLHF` Reinforcement Learning · `DPO` Direct Preference. 이 단계의 데이터 오염 = `T01`.

---

## 💥 공격 기법

### Prompt Injection (프롬프트 인젝션)
LLM 입력에 악성 지시를 끼워넣어 시스템 프롬프트를 우회·덮어쓰는 공격 (`LLM01`).
**Direct**: 사용자가 직접 입력 · **Indirect**: 외부 문서·이메일에 숨김 → LLM 이 처리할 때 발동 (EchoLeak).

### Jailbreak (탈옥)
LLM 의 안전 가드레일을 우회해 금지된 응답을 끌어내는 기법.
역할극 · 가설법 · 인코딩 (base64·ROT13) · 언어 전환 등. Gandalf 챌린지의 핵심 학습 주제.

### DAN — Do Anything Now
"규칙 없는 AI" 페르소나를 부여해 안전장치를 우회하는 대표적 jailbreak 패턴.
변종 15+ 종 (v6.0–11.0, STAN, DUDE, AntiDAN, Developer Mode). Garak `dan` 프로브가 자동 테스트.

### Zero-click
피해자가 클릭·입력·실행 등 어떤 행동도 하지 않아도 발생하는 공격.
교육으로 막을 수 없음 — 시스템 방어 필수. 사례: Pegasus · **EchoLeak** (MS 365 Copilot, 2025).

### Data Poisoning (데이터 오염)
학습 데이터에 의도적으로 악성 샘플을 섞어 모델 행동을 조작 (`T01`).
사례: Microsoft Tay (2016) — 24시간 만에 혐오 콘텐츠 생성. RAG 에선 벡터DB 에 오염 문서 삽입 (`LLM04`).

### Model Backdoor (모델 백도어)
특정 트리거(단어·패턴) 입력 시에만 악성 동작하는 모델 (`T03`).
평상시 정상 → 트리거에서만 발동. **정기 검사로 탐지 불가**. 공급망 공격 (`T14`) 결합 — Hugging Face 악성 모델 100+.

### Adversarial Example (적대적 예제 / 회피 공격)
사람 눈엔 정상이지만 AI 가 잘못 분류하도록 미세 변형한 입력 (`T09`).
이미지: 픽셀 노이즈로 표지판 오인식. LLM: invisible Unicode · 동음이의어 · zalgo 텍스트.

### Embedding Inversion (임베딩 역추출)
벡터값에서 원본 텍스트를 재구성 — 암호화 없는 벡터DB 의 치명적 약점.
Jina AI 공개 데모. 벡터DB 유출 시 **저장된 모든 문서가 사실상 평문 노출** 과 동일.

### Second-order Injection (2차 인젝션)
RAG 응답이 다른 시스템 입력이 될 때 발동하는 진화형 인젝션.
오염 문서 → RAG 응답에 `[CMD:...]` 토큰 포함 → 후속 스크립트가 명령으로 해석. **출력도 입력만큼 검증** 이 답.

---

## 🛡️ 방어 · 도구

### Guardrail (가드레일)
LLM 입출력 단에 배치되어 위험한 입력 차단 / 위험한 출력 필터링하는 보호 레이어.
입력: 인젝션 패턴·PII·금지 토픽 · 출력: 민감정보·환각·정책 위반. 슬롯3 방어 4 레이어의 ①·②.

### Red Teaming (레드 팀 / 공격적 보안 평가)
방어자 입장에서 실제 공격을 시뮬레이션해 시스템 약점을 능동적으로 발견.
LLM 에선 자동화 도구로 페이로드 수천 개 — Garak, promptfoo redteam, Lakera. 슬롯4·5 실습 핵심.

### Rate Limit (요청 제한)
시간당 요청 수·토큰 수를 제한해 남용·DoS·비용 폭주를 방지 (`LLM10`).
Prompt Flooding · Sponge Attack (GPU 폭주) 대응. 사용자별·IP별·키별 분리.

### RBAC — Role-Based Access Control (역할 기반 접근통제)
사용자 역할에 따라 자원·도구 접근 권한을 분리.
LLM 시대 핵심: **Agent 도구 권한 최소화**. CVE-2025-53773 같은 "AI 가 자기 권한 올림" 차단의 출발점.

### Garak (NVIDIA · LLM 취약점 스캐너)
37+ 프로브로 jailbreak·인젝션·환각·인코딩 우회 자동 시뮬레이션 (오픈소스).
LiteLLM 어댑터로 OpenAI · Gemini · 로컬 모델 동일 명령. v0.14.1+ HTML 리포트 자동. 슬롯4 Lab 1 메인 도구.

### LLM Guard / Lakera Guard (운영 시 실시간 게이트)
배포된 LLM 앞단에 두는 미들웨어 — 입력 스캐너 + 출력 필터.
Protect AI `LLM Guard` (15+21 스캐너, self-host) · `Lakera Guard` (Gandalf 제작사, SaaS) · NVIDIA `NeMo Guardrails` · Meta `Llama Guard`.

---

## 📋 프레임워크 · 정책

### OWASP LLM Top 10 (2025 개정판)
개발자 관점의 LLM 애플리케이션 10대 취약점 — 구현 결함 분류.
LLM01 인젝션 · LLM02 민감정보 · LLM03 공급망 · LLM04 오염 · LLM05 출력 미검증 · LLM06 과도 권한 · LLM07 프롬프트 유출 · LLM08 벡터/임베딩 · LLM09 환각 · LLM10 무제한 리소스.

### NIS T01–T15 (국정원 AI 보안 위협 분류)
4 레이어 (입력 / 학습데이터·모델 / 인프라·운영 / 공급망) 의 15개 위협 + M01–M30 대책.
예: T07 민감정보 · T08 인젝션 · T01 오염 · T12 모니터링 부재 · T14 공급망. **법적·정책 기반 — "무엇이 위협인가"**.

### KISA 안내서 (한국인터넷진흥원)
두 안내서: ① AI 보안 (2026.03) — *Security for AI* / ② 생성형 AI 개인정보 (2025.08) — *Privacy in AI*.
3대 역할 (개발자 · 제공자 · 이용자). NIS 가 "What" 이라면 KISA 는 "Who/How".

---

## 📝 추가 가이드

새 용어 발견 시 위 5개 카테고리 중 하나에 추가. 각 항목 템플릿:

```markdown
### 용어 (한글)
한 줄 정의.
부연 설명 (1-2 줄).
```

---

**현재 30개 용어 · 최종 갱신 2026-05-12**
