# 🚨 실제 사고 사례

> 2025–2026 LLM 보안 사고 — 공격 흐름 · 영향 · 핵심 교훈
>
> [← 참고자료 인덱스](README.md) · [강사 가이드](../ws02_instructor_guide.md)

---

## 빠른 점프
[`EchoLeak`](#echoleak) · [`CVE-2025-53773 (Copilot)`](#copilot-rce)

---

## EchoLeak — Microsoft 365 Copilot Zero-click <a id="echoleak"></a>

> *공격자가 이메일 1통 보내면 — 사용자가 클릭 한 번 안 해도 회사 데이터 유출*

| 항목 | 내용 |
|---|---|
| 시기 | 2025년 후반 발견 |
| 대상 | Microsoft 365 Copilot |
| 신규 클래스 | [Zero-click](terms.md#zero-click) [prompt injection](terms.md#prompt-injection) |
| 영향 | OneDrive · SharePoint · Teams 데이터 추출 |

### 공격 흐름

```
① 공격자가 이메일 발송 (히든 지시 포함)
② Copilot 이 사용자 메일함 처리 시 그 이메일도 읽음
③ 이메일 내 숨은 지시가 Copilot 시스템 프롬프트와 섞임
④ Copilot 이 "사용자를 위한 도움" 으로 위장된
   데이터 검색·전송 실행
⑤ 외부로 데이터 유출 — 사용자 클릭 0회
```

### 주요 통찰
- **사용자 행동 의존 없는 공격** — 기존 프롬프트 인젝션은 사용자가 입력해야 했음
- AI 비서가 자동으로 "도움" 을 주려는 행동이 공격 표면이 됨
- LLM 시대의 **"수동적 침투"** — 메일 받기만 해도 위험

### 🔑 핵심 교훈
> AI 비서 = 신뢰의 자동화. 그 자동화 자체가 새로운 공격면.

---

## CVE-2025-53773 — GitHub Copilot RCE (CVSS 9.3) <a id="copilot-rce"></a>

> *AI 가 자기 손으로 자기 사용자 승인을 끄고 [RCE](terms.md#rce) 까지*

| 항목 | 내용 |
|---|---|
| 보고 | 2025.06.29 (Embrace The Red) |
| 패치 | 2025.08 Patch Tuesday |
| 영향 | Visual Studio Code · GitHub Copilot 사용 모든 OS |
| CVSS | **9.3 (Critical)** |

### 공격 흐름

```
① 공격자가 악성 프롬프트 숨김
   - 소스 파일 / 웹 / GitHub 이슈
   - invisible Unicode 로 사람 눈에 안 보이게도 가능

② Copilot 이 그 콘텐츠를 처리할 때 인젝션 인식

③ Copilot 이 .vscode/settings.json 에 한 줄 추가:
   "chat.tools.autoApprove": true     ← "YOLO mode" 활성화

④ 모든 셸 명령이 사용자 승인 없이 실행
   → RCE (Windows · macOS · Linux 다 영향)

⑤ 웜화: 다른 Git 프로젝트에 같은 인젝션 commit/push
   → 다른 개발자 머신 감염 → 봇넷 ("ZombAI")
```

### 주요 통찰
- **"자동 승인" 모드 자체가 공격 표면**
- AI 가 **자기 권한을 자기 명령으로 올림** — Privilege escalation by AI itself
- Invisible Unicode — 사람 코드 리뷰로는 못 잡음
- 보고 → 패치까지 **약 6주** (Microsoft 신속 대응)

### 🔑 핵심 교훈
> AI IDE = 권한이 많은 도우미. 권한 최소화 + 매번 명시적 승인 — 슬롯3 방어 4 레이어 ③ 의 중요성.

---

## 출처

### EchoLeak
- [LLM Security Risks in 2026 — Sombra](https://sombrainc.com/blog/llm-security-risks-2026)
- [AI & Cloud Security Breaches: 2025 Year in Review — Reco AI](https://www.reco.ai/blog/ai-and-cloud-security-breaches-2025)

### GitHub Copilot CVE-2025-53773
- [GitHub Copilot RCE via Prompt Injection — Embrace The Red](https://embracethered.com/blog/posts/2025/github-copilot-remote-code-execution-via-prompt-injection/)
- [CVE-2025-53773 Detail — NVD](https://nvd.nist.gov/vuln/detail/CVE-2025-53773)
- [CVE-2025-53773 Impact & Mitigation — Wiz](https://www.wiz.io/vulnerability-database/cve/cve-2025-53773)
