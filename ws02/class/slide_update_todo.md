# 슬라이드 업데이트 TODO

> 출처: `curriculum_update_2026.md` (2026.05.10 검색 기반)
> 강사 가이드 `ws02_instructor_guide.md` 의 강사 포인트는 이미 갱신됨
> 본 문서: **슬라이드 (.pptx) 에 추가/수정할 항목** 만 정리
> 작업 도구: Claude Design 또는 직접 PowerPoint

---

## ⚠️ 강의 범위 결정 (2026-05-10) — Agent 영역 제외

본 워크숍 (ws02) 은 **단일 LLM / RAG 보안** 중심.
**Agentic AI · MCP · 멀티 에이전트** 는 별도 회차로 분리.

### ❌ 제외된 TODO (참조용으로만 유지)

- **TODO 1.3 — Cursor IDE CVE** (CVE-2025-54135 / 54136) — MCP 신뢰 우회
- **TODO 2 — OWASP Agentic Top 10** (ASI01–10, 2026 신규)
- **TODO 3 — MCP 보안** (Anthropic SDK RCE, Tool poisoning 통계)

### ✅ 진행할 TODO

- **TODO 1.1 — EchoLeak** (zero-click — 일반 LLM 사례로)
- **TODO 1.2 — GitHub Copilot CVE-2025-53773**
- **TODO 4.1 — Vector DB 노출 통계** (Lab 2)
- **TODO 4.2 — Second-order Prompt Injection** (RAG → 후속 시스템, 다중 에이전트 표현 X)
- **TODO 5 — KISA 안내서 2026.03 + 개인정보 처리 안내서 (2025.08)**

---

## 🔥 우선순위 1 — 사고 사례 (슬롯1)

### TODO 1.1 — EchoLeak (Microsoft 365 Copilot, 2025 후반)

**위치**: `ws02_handout_slot1.pptx` / `slot1_class.pptx` 의 **사고 사례 섹션** (삼성·딥시크 옆 또는 신규 1장)

**핵심 메시지** (한 줄):
> "사용자가 클릭 한 번 안 해도 AI 가 공격자 명령을 실행한다 — Zero-click prompt injection"

**카드 내용**:
- 시기: 2025 후반 발견
- 대상: Microsoft 365 Copilot
- 공격 방식: 공격자가 이메일 1통 발송 → Copilot 이 이메일 내 숨겨진 지시를 인식 → 사용자 OneDrive · SharePoint · Teams 데이터 추출
- 신규 취약점 클래스: **Zero-click prompt injection**
- 영향: 실제 enterprise 환경에서 데이터 유출 입증

**시각 힌트**:
- 빨간색 강조 (zero-click 키워드)
- 작은 다이어그램: `이메일` → `Copilot` → `OneDrive 데이터 유출`

---

### TODO 1.2 — GitHub Copilot RCE (CVE-2025-53773)

**위치**: 슬롯1 사고 사례 또는 슬롯2 LLM01 항목 옆

**핵심 메시지**:
> "프롬프트 인젝션이 RCE 까지 — CVSS 9.3"

**카드 내용**:
- CVE: **CVE-2025-53773** (CVSS 9.3)
- 영향: 수백만 개발자 머신 손상 가능
- 패턴: 프롬프트 인젝션 → 코드 자동 생성 → RCE

---

### TODO 1.3 — Cursor IDE 취약점 (CVE-2025-54135 / 54136)

**위치**: 슬롯3 (MCP 도입) 또는 슬롯1 사고 사례

**핵심 메시지**:
> "MCP 신뢰 메커니즘 우회 — IDE 가 사용자 모르게 임의 명령 실행"

**카드 내용**:
- CVE: **CVE-2025-54135** (CVSS 9.6), **CVE-2025-54136** (CVSS 9.8)
- 공격 방식: MCP 함수 신뢰·검증 우회
- 결과: Cursor IDE 가 백그라운드에서 임의 명령 실행

---

## 🔥 우선순위 2 — OWASP Agentic Top 10 (슬롯2)

### TODO 2 — OWASP Top 10 for Agentic Applications (2026 신규) 매핑

**위치**: `ws02_handout_slot2.pptx` / `slot2_class.pptx` 의 **NIS·OWASP 매핑 표 (slide 28) 옆 또는 신규 2장**

**핵심 메시지**:
> "OWASP 가 LLM Top 10 외에 Agentic Top 10 (2026) 을 별도로 발표 — 도구 호출·메모리·다중 에이전트 시스템 전용"

**카드 내용** (1장 또는 2장으로):

**A. Agentic Top 10 (2026) 신규 카테고리**:
- Agent Hijacking — 에이전트 목표 변경
- Multi-Modal Injection — 이미지·오디오 통한 인젝션
- Memory Persistence Attacks — 장기 메모리 오염
- Goal Misalignment — 목표 정렬 실패
- Tool Misuse — 도구 오남용
- Delegated Trust — 위임 신뢰 악용
- Inter-agent Communication — 에이전트 간 통신 공격

**B. LLM Top 10 vs Agentic Top 10 비교**:
| | LLM Top 10 (2025) | Agentic Top 10 (2026) |
|---|---|---|
| 대상 | 단일 LLM | 도구 호출·메모리·다중 에이전트 |
| 핵심 위협 | 프롬프트 인젝션, 출력 처리 | Agent Hijacking, 메모리 오염 |
| 비고 | 챗봇 시대 | 에이전트 시대 |

**시각 힌트**:
- 슬롯2 의 기존 OWASP 매핑 표 디자인 (NIS · KISA · OWASP) 와 일관된 컬러
- 아이콘: 🤖 (에이전트), 🧠 (메모리), 🔧 (도구)

---

## 🔥 우선순위 3 — MCP 보안 (슬롯3)

### TODO 3 — Model Context Protocol 보안 (1장 추가)

**위치**: `slot3_class.pptx` / `ws02_slot3_defense_lecture.pptx` 의 **PART 2 (자동화 검증) 다음** 또는 PART 1 끝

**핵심 메시지**:
> "MCP — 에이전트 / 도구 호출 시대의 새 공격면. 2026년 가장 핫한 LLM 보안 주제"

**카드 내용**:

**왼쪽 — 통계**:
- 공개 MCP 서버 7,000개 분석 결과
- **36.7%** SSRF 취약
- **43%** 1개 이상 취약점
- **5.5%** 이미 poisoned descriptions
- Trend Micro 발견: **492개** 인증 0 + 암호화 0

**오른쪽 — 주요 공격 패턴**:
- **Tool Poisoning** — 도구 메타데이터에 악성 지시 (auto-approval 시 84% 성공률)
- **Anthropic MCP STDIO RCE** — 공식 SDK 의 설계 결함, 모든 언어 (Python·TS·Java·Rust) 영향
- **Indirect prompt injection** — 도구 설명에 숨겨진 명령
- **Identity Spoofing** — 인증 약점

**한 줄 결론**:
> "도구 호출이 늘수록 공격면도 비례 — 권한 최소화 (방어 4 레이어 ③) 가 더욱 중요"

**시각 힌트**:
- 다이어그램: `LLM` ↔ `MCP 서버` ↔ `외부 도구` (각 화살표에 ⚠ 표시)

---

## 🔶 우선순위 4 — Vector DB 노출 (슬롯5 / Lab 2)

### TODO 4.1 — Vector DB 노출 통계 슬라이드 (Lab 2)

**위치**: `slot5_class.pptx` / `ws02_Lab2_RAG_VectorDB.pptx` 의 **Step 2C (RAG 인젝션) 또는 Step 0 다음**

> 노트북에는 이미 markdown 박스로 추가됨 (`Step 0-2`).
> 슬라이드는 시각적 임팩트 위해 추가 권장.

**핵심 메시지**:
> "RAG 시대의 Vector DB = 새로운 인터넷 공개 데이터베이스 위기"

**카드 내용**:
- 공개 인증 없는 Vector DB 서버 **3,000+ 개** 발견
- 대상: Milvus · Weaviate · Chroma
- 모두 **Swagger API 문서까지 노출**
- 결과: 공격자가 스키마/쿼리 알고 직접 삽입·조회

**시각 힌트**:
- 큰 숫자 강조: "3,000+" · "0% 인증"
- 빨간 배경 카드

---

### TODO 4.2 — Second-order Prompt Injection (Lab 2)

**위치**: `slot5_class.pptx` 의 **Step 2C (RAG 인젝션) 옆 또는 신규 1장**

> 노트북 Step 2C-3 에 시뮬레이션 셀 추가됨. 슬라이드도 시각화 권장.

**핵심 메시지**:
> "1단계 RAG 인젝션 → 2단계 다른 시스템·에이전트 권한 우회"

**카드 내용**:
- ServiceNow AI 비서 사례 (2025 후반)
- 흐름: 저권한 에이전트 → 오염 문서 검색 → 응답 안에 명령 토큰 → **고권한 에이전트** 가 그 토큰을 명령으로 해석 → 권한 검사 우회
- 노트북 시뮬레이션: 응답 끝에 `[ESCALATE: ...]` 출력되는 모습 확인

**시각 힌트**:
- 2단계 다이어그램: `LowPriv Agent` → `Poisoned Doc` → `Response (with hidden cmd)` → `HighPriv Agent`
- 화살표가 시스템 경계를 넘는 것을 강조

---

## 🔷 우선순위 5 — KISA 안내서 버전 표기 (슬롯1·2)

### TODO 5 — KISA 안내서 버전 갱신

**위치**: 슬롯1 / 슬롯2 의 KISA 안내서 인용 부분

**작은 텍스트 변경만** (디자인 변경 없음):
- "KISA 인공지능(AI) 보안 안내서" → **"KISA 인공지능(AI) 보안 안내서 (2026.03 수정판)"**
- 신규 언급: "KISA 생성형 AI 개발·활용을 위한 개인정보 처리 안내서 (2025.08)"

**검증 방법**: 강사가 강의 중 *"가장 최신은 2026.03"* 한 줄 언급으로 충분

---

## 작업 분담 권장

| TODO | 작업 도구 | 비고 |
|---|---|---|
| 1.1 EchoLeak 사고 카드 | Claude Design | HEAAN 디자인 매칭 |
| 1.2 GitHub Copilot CVE | 작은 카드 — 텍스트만 | 직접 |
| 1.3 Cursor CVE | 작은 카드 | 직접 또는 Design |
| 2 OWASP Agentic Top 10 | Claude Design | 표 + 비교 |
| 3 MCP 보안 1장 | Claude Design | 다이어그램 + 통계 |
| 4.1 Vector DB 통계 | 직접 또는 Design | 큰 숫자 강조 |
| 4.2 Second-order | Claude Design | 다이어그램 |
| 5 KISA 버전 | 텍스트만 | 직접 |

---

## 출처 (slide 인용용)

| 항목 | 링크 |
|---|---|
| EchoLeak | [Reco AI — 2025 Year in Review](https://www.reco.ai/blog/ai-and-cloud-security-breaches-2025) |
| GitHub Copilot CVE | [LLM Security Risks in 2026 — Sombra](https://sombrainc.com/blog/llm-security-risks-2026) |
| Cursor IDE CVE | [Same article](https://sombrainc.com/blog/llm-security-risks-2026) |
| OWASP Agentic Top 10 | [DeepTeam](https://www.trydeepteam.com/docs/frameworks-owasp-top-10-for-agentic-applications) |
| MCP 보안 통계 | [Aembit Guide 2026](https://aembit.io/blog/the-ultimate-guide-to-mcp-security-vulnerabilities/), [The Hacker News](https://thehackernews.com/2026/04/anthropic-mcp-design-vulnerability.html) |
| Vector DB 노출 | [Cyberbit](https://www.cyberbit.com/campaign/llm-rag-attacks-prompt-injections/), [Prompt Security](https://prompt.security/blog/the-embedded-threat-in-your-llm-poisoning-rag-pipelines-via-vector-embeddings) |
| ServiceNow second-order | [Sombra LLM Security 2026](https://sombrainc.com/blog/llm-security-risks-2026) |
| KISA 안내서 | [KISA 공식](https://www.kisa.or.kr/2060204/form?postSeq=19&page=1) |

---

## 적용 완료 후 정리

- 모든 TODO 완료 시: `curriculum_update_2026.md` 와 본 문서 → `archives/` 로 이동
- `instructor_guide.md` 의 "강사 포인트" 는 이미 모든 변경사항 반영 완료
