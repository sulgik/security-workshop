# 강의 반영 계획 — 2026.05 최신 트렌드 업데이트

> 작성일: 2026.05.10
> 목적: 검색된 최신 LLM 보안 트렌드를 ws02 강의에 반영

---

## ⚠️ 강의 범위 결정 (2026-05-10) — Agent 영역 제외

본 워크숍은 **단일 LLM / RAG 보안** 중심. **Agentic AI · MCP · 멀티 에이전트** 위협은 별도 회차.

### ❌ 본 회차 제외 (아래 본문 항목은 **참조용으로만 유지**)

- 슬롯1: **Cursor IDE CVE** (54135 / 54136 — MCP 신뢰 우회)
- 슬롯2: **OWASP Agentic Top 10** (ASI01–10, 2026 신규)
- 슬롯3: **MCP Security** 1장 (Anthropic SDK RCE / Tool poisoning 통계)

### ✅ 본 회차 진행

- 슬롯1: EchoLeak · GitHub Copilot CVE · KISA 안내서 두 가지
- 슬롯5: Vector DB 노출 통계 · Second-order injection (RAG → 후속 시스템 톤)

→ 적용 결과는 `class/slide_update_todo.md` 와 `ws02_instructor_guide.md` 참조

---

## 1. 슬롯1 (NIS·KISA) — 사고 사례 강화 🔥 최우선

### 추가할 사례 (도입부 임팩트용)

#### EchoLeak — Microsoft 365 Copilot Zero-click Prompt Injection (2025 후반)
- **공격자가 이메일만 보내면** 사용자 클릭 없이 회사 데이터 유출
- 영향: OneDrive · SharePoint · Teams 데이터 추출
- 신규 취약점 클래스: **zero-click prompt injection**
- **메시지**: "사용자가 아무것도 안 해도 AI 가 공격자 명령을 실행"

#### GitHub Copilot CVE-2025-53773 (CVSS 9.3)
- 프롬프트 인젝션으로 RCE — 개발자 머신 손상
- 수백만 개발자 영향

#### Cursor IDE CVE-2025-54135 / 54136 (CVSS 9.6 / 9.8)
- MCP 신뢰 메커니즘 우회 → IDE 가 사용자 모르게 임의 명령 실행

### 적용 방식
- 슬롯1 의 사고 사례 섹션(삼성·딥시크 등 옆)에 **"2025-2026 최신"** 박스 추가
- 1장 슬라이드: "AI 가 공격자 도구가 된다 — 클릭 한 번 없이"

### 🔒 KISA 안내서 버전 갱신
- 현재 슬롯1·2 가 인용하는 안내서 → **2026.03 수정판** 으로 표기 갱신
- 신규: KISA 생성형 AI 개인정보 처리 안내서 (2025.08) 언급

---

## 2. 슬롯2 (OWASP) — Agentic Top 10 추가 🔥 최우선

### 현황
- 슬롯2 는 OWASP LLM Top 10 (v2.0, 2025) 다룸 ✓
- LLM07 System Prompt Leakage, LLM08 Vector/Embedding Weakness 포함됨 ✓

### 신규 추가 — OWASP Top 10 for Agentic Applications (2026)
- **별도 프레임워크**로 등장 — 단순 LLM 챗봇이 아닌 도구 호출·메모리·다중 에이전트 시스템
- 신규 위협:
  - **Agent Hijacking** — 에이전트 목표 변경
  - **Multi-Modal Injection** — 이미지/오디오 통한 인젝션
  - **Memory Persistence Attacks** — 장기 메모리 오염
  - Goal misalignment, Tool misuse, Delegated trust, Inter-agent communication

### 적용 방식
- 슬롯2 끝부분 (slide 28~31 근처) 에 **2장 추가**:
  - "OWASP LLM Top 10 + Agent Top 10 (2026)" 매핑 표
  - "전통 LLM vs Agentic 보안 차이" 한 장

---

## 3. 슬롯3 (방어 + 자동화 검증) — MCP 보안 추가 🔥 신규

> 이전에 "agent 부분은 빼자" 했으나, 이번에 다 다루기로 결정 → 적용

### 신규 추가 — MCP Security
- **2026 가장 핫한 LLM 보안 주제**
- 통계: 7,000개 공개 서버 중 36.7% SSRF, 43% 1개 이상 취약, Tool poisoning 84% 성공률
- Anthropic SDK 의 STDIO RCE — 공식 SDK 가 모든 언어(Python·TS·Java·Rust)에서 영향
- **Trend Micro 통계: 인증·암호화 없는 MCP 서버 492개**

### 적용 방식
- 슬롯3 PART 2 (자동화 검증) 다음에 **PART 2.5 — Agent / MCP 보안** 1장 추가
- 또는 PART 1 방어 4 레이어를 5 레이어로:
  - 입력 검증 / 출력 필터 / **권한 최소화 (← MCP tool 권한 포함)** / 모니터링 / **에이전트 행동 제약**

---

## 4. 슬롯4 (Lab 1 Garak) — 최신 버전 반영

### Garak v0.14.1 (2026.04 출시)
- 기존 노트북이 v0.14+ 기준 ✓
- 신규: **redesigned HTML reports**, JSON config 지원
- 37+ 프로브 모듈, DAN 변종 15+ (6.0~11.0, STAN, DUDE, AntiDAN, ChatGPT Developer Mode)
- 인코딩: Base64/16/32, ROT13, Morse, Braille, ASCII85, hex

### 적용 방식 (Lab 1 노트북 minor)
- 패키지 설치: `garak>=0.14.1` 명시
- Step B (결과 분석) 에 **HTML 리포트 자동 생성** 안내 1줄 추가
- Step C 커스텀 프로브 — DAN 변종 다양성 언급

---

## 5. 슬롯5 (Lab 2 RAG/VectorDB) — 신규 공격 시나리오

### Vector DB 대규모 노출 (2025-2026 통계)
- **3,000+ 공개 인증 없는 Vector DB 서버**: Milvus, Weaviate, Chroma
- 모두 Swagger 문서 노출 → 공격자가 스키마/쿼리 알고 공격

### Second-order Prompt Injection (ServiceNow 2025 후반)
- 저권한 에이전트 → **고권한 에이전트에게 요청 위임** → 권한 우회
- 단순 RAG 인젝션의 진화형

### 적용 방식
- 노트북 Step 2C (RAG 인젝션) 에 second-order 시나리오 셀 추가
- Step 2D (임베딩 역추출) 옆에 "**Vector DB 노출 통계**" 1장 슬라이드
- 강조: "RAG 보안 = 데이터 파이프라인 + Vector DB 인증 + 검색 결과 격리"

---

## 6. 우선순위 정리

| 우선순위 | 작업 | 위치 | 도구 |
|---|---|---|---|
| 🔥 1 | EchoLeak / GitHub Copilot CVE 사고 사례 추가 | 슬롯1 | Claude Design (사용자 슬라이드 디자인 매칭) |
| 🔥 2 | MCP 보안 (Tool poisoning, RCE) 1장 | 슬롯3 또는 슬롯2 | Claude Design |
| 🔥 3 | OWASP Agentic Top 10 (2026) 매핑 | 슬롯2 | Claude Design |
| 🔶 4 | KISA 안내서 2026.03 버전 표기 | 슬롯1·2 | 텍스트 수정만 |
| 🔶 5 | Vector DB 노출 통계 + Second-order 인젝션 | 슬롯5 / Lab 2 | Code (노트북) + Design (슬라이드) |
| 🔷 6 | Garak v0.14.1 신규 기능 (HTML 리포트) | Lab 1 노트북 | Code |

---

## 7. Handout 작업 원칙 메모

- ✅ Handout 버전이 **먼저 확정** (print-out 우선)
- ✅ Handout 에 맞는 포맷 (인쇄 친화)
- ✅ Handout 의 코드는 **수강자가 그대로 따라쳐도 작동** 해야 함 (실행 검증된 것만)

위 트렌드 반영 시에도 이 원칙 준수.

---

## 출처

### OWASP LLM / Agentic Top 10
- [OWASP LLM Top 10 2026 — ScanMyLLM](https://scanmyllm.com/owasp-llm-top-10-2026)
- [OWASP LLM Top 10: AI Security Risks 2026 — Elevate Consulting](https://elevateconsult.com/insights/owasp-llm-top-10-security-vulnerabilities-every-ai-developer-must-know-in-2026/)
- [OWASP Top 10 for Agents 2026 — DeepTeam](https://www.trydeepteam.com/docs/frameworks-owasp-top-10-for-agentic-applications)
- [OWASP LLM Top 10 2026 Complete Guide — Repello AI](https://repello.ai/blog/owasp-llm-top-10-2026)

### MCP / Agent 보안
- [Anthropic MCP Design Vulnerability Enables RCE — The Hacker News](https://thehackernews.com/2026/04/anthropic-mcp-design-vulnerability.html)
- [MCP Security Vulnerabilities Complete Guide 2026 — Aembit](https://aembit.io/blog/the-ultimate-guide-to-mcp-security-vulnerabilities/)
- [Securing the Model Context Protocol — Zenity](https://zenity.io/blog/security/securing-the-model-context-protocol-mcp)
- [The Mother of All AI Supply Chains — OX Security](https://www.ox.security/blog/the-mother-of-all-ai-supply-chains-critical-systemic-vulnerability-at-the-core-of-the-mcp/)

### 실제 사고 사례
- [Prompt Injection Attacks: Most Common AI Exploit 2025 — Obsidian Security](https://www.obsidiansecurity.com/blog/prompt-injection)
- [LLM Security Risks in 2026 — Sombra](https://sombrainc.com/blog/llm-security-risks-2026)
- [AI & Cloud Security Breaches: 2025 Year in Review — Reco AI](https://www.reco.ai/blog/ai-and-cloud-security-breaches-2025)

### Garak
- [NVIDIA Garak GitHub](https://github.com/NVIDIA/garak)
- [Garak 2026 — AppSec Santa](https://appsecsanta.com/garak)
- [Garak Vulnerability Scanner: Nessus for LLMs](https://www.toxsec.com/p/garak-llm-vulnerability-scanner)

### 한국 KISA
- [KISA 인공지능(AI) 보안 안내서](https://www.kisa.or.kr/2060204/form?postSeq=19&page=1)
- [KISA 생성형 AI 개인정보 처리 안내서](https://www.kisa.or.kr/2060301/form?postSeq=41&lang_type=KO&page=1)
- [KISA 생성형 AI 보안 가이드 정리 — Peekaboo Labs](https://peekaboolabs.ai/blog/kisa-ai-security-guide)

### RAG / Vector DB
- [LLM and RAG attacks — Cyberbit](https://www.cyberbit.com/campaign/llm-rag-attacks-prompt-injections/)
- [Embedded Threat: Poisoning RAG Pipelines — Prompt Security](https://prompt.security/blog/the-embedded-threat-in-your-llm-poisoning-rag-pipelines-via-vector-embeddings)
- [Vector Drift, Prompt Injection, Hidden RAG Attack Surface](https://securitysandman.com/2025/06/10/vector-drift-prompt-injection-and-the-hidden-ai-rag-attack-surface/)
- [The Hidden Attack Surfaces of RAG and MCP — Deconvolute Labs](https://deconvoluteai.com/blog/attack-surfaces-rag)
