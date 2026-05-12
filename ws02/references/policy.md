# 📜 정책 자료 — KISA 안내서

> 국내 AI 보안·개인정보 정책 안내서 (KISA / 개인정보보호위원회)
>
> [← 참고자료 인덱스](README.md) · [강사 가이드](../ws02_instructor_guide.md)

---

## 빠른 점프
[`AI 보안 안내서 (2026.03)`](#kisa-security) · [`생성형 AI 개인정보 (2025.08)`](#kisa-privacy) · [`두 안내서 비교`](#kisa-compare)

---

## 인공지능(AI) 보안 안내서 (2026.03 수정판) <a id="kisa-security"></a>

> *AI 시스템 자체를 외부 공격으로부터 보호하는 방법*

| 항목 | 내용 |
|---|---|
| 발행 | KISA + 국정원 |
| 시각 | **Security for AI** — AI 시스템 외부 공격 보호 |
| 매핑 | NIS T01–T15, OWASP LLM Top 10 |
| 대상 역할 | 개발자 · 제공자 · 이용자 (3대 역할) |

다루는 위협: [프롬프트 인젝션](terms.md#prompt-injection), 모델 탈취, 데이터 오염, RAG 인젝션 등. 슬롯1·2 강의의 핵심 자료.

---

## 생성형 AI 개인정보 처리 안내서 (2025.08) — 신규 <a id="kisa-privacy"></a>

> *AI 가 만들어내는 위험으로부터 개인정보를 보호하는 방법*

| 항목 | 내용 |
|---|---|
| 발행 | 개인정보보호위원회 + KISA |
| 시각 | **Privacy in AI** — AI 가 만들어내는 위험으로부터 개인정보 보호 |
| 대상 | 생성형 AI 개발/활용 기업·기관 |

### 4단계 수명주기

| 단계 | 핵심 |
|---|---|
| ① 목적 설정 | AI 사용 목적 + 처리할 개인정보 범위 |
| ② 전략 수립 | 데이터 수집·전처리·보호 방안 |
| ③ AI 학습 및 개발 | 가명처리, 학습데이터 관리, 공개 데이터 |
| ④ 시스템 적용 및 관리 | 운영 모니터링, 사고 대응 |

### 핵심 키워드
- **비정형 데이터 가명처리** (이미지·영상·음성) — KISA 비정형 데이터 가명처리 기준 (2024.2) 참고
- **AI 프라이버시 거버넌스** — CPO 중심 전사 관리체계
- **사례**: 병원 MRI/CT/X-Ray 가명처리

---

## 두 안내서의 관계 <a id="kisa-compare"></a>

| 시각 | 보안 안내서 (2026.03) | 개인정보 처리 안내서 (2025.08) |
|---|---|---|
| 보호 대상 | AI 시스템 자체 | AI 가 처리하는 개인정보 |
| 위협 종류 | 외부 공격 (인젝션, 탈취) | 학습/운영 중 정보 노출 |
| 활용 방식 | NIS·OWASP 와 매핑해 위협 분류 | 4단계 수명주기 + Privacy by Design |
| 강의 위치 | 슬롯1·2 위협 분류 부분 | 슬롯1 KISA 섹션에 한 줄 |

### 🔑 핵심 교훈
> 보안 안내서가 "공격으로부터 AI 보호" 라면, 개인정보 안내서는 "AI 가 만들어내는 위험으로부터 사람 보호" — 두 시각 모두 필요.

---

## 공식 자료 링크

- [KISA AI 보안 안내서 (공식)](https://www.kisa.or.kr/2060204/form?postSeq=19&page=1)
- [KISA 생성형 AI 개인정보 처리 안내서 (공식)](https://www.kisa.or.kr/2060301/form?postSeq=41&lang_type=KO&page=1)
- [PDF 본문 — 개인정보 처리 안내서 (2025.08)](https://smartcity.go.kr/wp-content/uploads/2025/09/%EB%B3%84%EC%B2%A82-%EC%83%9D%EC%84%B1%ED%98%95-%EC%9D%B8%EA%B3%B5%EC%A7%80%EB%8A%A5AI-%EA%B0%9C%EB%B0%9C%C2%B7%ED%99%9C%EC%9A%A9%EC%9D%84-%EC%9C%84%ED%95%9C-%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4-%EC%B2%98%EB%A6%AC-%EC%95%88%EB%82%B4%EC%84%9C.pdf)
- [KISA 생성형 AI 보안 가이드 정리 — Peekaboo Labs](https://peekaboolabs.ai/blog/kisa-ai-security-guide)
