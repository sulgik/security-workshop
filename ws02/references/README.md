# ws02 참고자료 — 카테고리별 정리

> 강의에 등장하는 보안 용어 · 사고 사례 · 심화 개념 · 정책 자료
>
> HTML 버전: [`index.html`](index.html)
> 강사 가이드: [`../ws02_instructor_guide.md`](../ws02_instructor_guide.md)

---

## 📚 카테고리

| 카테고리 | 내용 | 파일 |
|---|---|---|
| 📖 **보안 용어** | RCE · CVSS · Prompt Injection · Zero-click | [`terms.md`](terms.md) |
| 🚨 **실제 사고 사례** | EchoLeak · GitHub Copilot RCE (CVE-2025-53773) | [`incidents.md`](incidents.md) |
| 🔬 **심화 개념** | Second-order Prompt Injection (RAG → 후속 시스템) | [`concepts.md`](concepts.md) |
| 📜 **정책 자료** | KISA AI 보안 안내서 (2026.03) · 생성형 AI 개인정보 처리 안내서 (2025.08) | [`policy.md`](policy.md) |

---

## 📝 이 자료는 계속 확장됩니다

강의에 새로운 용어·사고 사례·개념이 등장할 때마다 해당 카테고리 파일에 추가됩니다.

**최근 추가** (2026-05-11): `RCE` · `CVSS` · `Prompt Injection` · `Zero-click`

### 새 항목 추가 가이드

각 카테고리 파일에 동일한 템플릿으로 추가:

```markdown
## 제목

> 한 줄 요약

| 항목 | 내용 |
|---|---|
| ... | ... |

### 본문 (흐름 / 설명 / 예시)

### 🔑 핵심 교훈
- ...
```

---

## 사용법

| 시점 | 추천 |
|---|---|
| **강의 중** | 모르는 용어 → [`terms.md`](terms.md) |
| **강의 후** | 사고 흐름 다시 보기 → [`incidents.md`](incidents.md) |
| **심화 학습** | [`concepts.md`](concepts.md) |
| **실무 적용** | 회사·기관 정책 수립 시 [`policy.md`](policy.md) |
