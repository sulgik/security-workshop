# LiteLLM Proxy 강사 설정 가이드

## 1. 설치 (강의 전날 1회)

```bash
pip install 'litellm[proxy]'
```

설치 확인:
```bash
litellm --version
# 또는
~/Library/Python/3.13/bin/litellm --version
```

---

## 2. API 키 설정

`ws02/run_proxy.sh` 파일을 열어 아래 줄을 수정합니다:

```bash
export GEMINI_API_KEY="your-key-here"
#                      ↑ 실제 키로 교체
```

Gemini API 키 발급: https://aistudio.google.com/apikey

---

## 3. 강의 당일 실행

```bash
# 저장소 루트에서
bash ws02/run_proxy.sh
```

실행 후 터미널에 출력되는 IP 주소를 칠판/화면에 공지합니다.

---

## 4. 수강생 공지 내용

```
INSTRUCTOR_IP    = "192.168.x.x"    ← 터미널에 출력된 IP
LITELLM_API_KEY  = "sk-workshop-2025"
MODEL_NAME       = "gemini-2.5-flash-lite"
```

---

## 5. 연결 테스트 (proxy 실행 후 같은 터미널 또는 새 탭)

```bash
curl http://localhost:4000/v1/chat/completions \
  -H "Authorization: Bearer sk-workshop-2025" \
  -H "Content-Type: application/json" \
  -d '{"model":"gemini-2.5-flash-lite","messages":[{"role":"user","content":"ping"}]}'
```

응답에 `"content"` 가 보이면 정상.

---

## 6. 트러블슈팅

| 증상 | 원인 | 해결 |
|---|---|---|
| `Connection refused` | IP 오류 또는 proxy 미실행 | IP 재확인, 스크립트 재실행 |
| `401 Unauthorized` | API key 오류 | `sk-workshop-2025` 확인 |
| `429 Too Many Requests` | 순간 요청 과다 | 잠시 후 재시도 |
| `timeout` | 수강생 와이파이 미연결 | 와이파이 확인 |

---

## 연결 구조

```
수강생 노트북 × 20  (Colab)
        ↓  같은 와이파이
강사 맥북 :4000  (LiteLLM proxy)
        ↓
Gemini API  (강사 유료 key)
```
