# 배포 가이드 — GitHub Pages

## 폴더 구조

```
your-repo/
├── index.html                          ← 랜딩 페이지
├── 실습1_v6.pptx                       ← 실습 1 슬라이드
├── 실습2_v7.pptx                       ← 실습 2 슬라이드
├── Day3/
│   ├── 3일차_실습1_프롬프트인젝션_데이터유출_권한오남용.ipynb
│   └── 3일차_실습2_프레임워크_임베딩_VectorDB_RAG보안.ipynb
└── DEPLOY.md
```

---

## Step 1 — GitHub 저장소 생성

1. https://github.com/new 접속
2. Repository name: `ai-security-lab` (원하는 이름)
3. Public 선택 (GitHub Pages 무료 사용 조건)
4. Create repository 클릭

---

## Step 2 — 파일 업로드

```bash
git clone https://github.com/YOUR_USER/ai-security-lab
cd ai-security-lab

# 위 파일들을 복사 후:
git add .
git commit -m "Add Day 3 lab materials"
git push
```

또는 GitHub 웹에서 **Upload files** 버튼으로 드래그 업로드 가능.

---

## Step 3 — GitHub Pages 활성화

1. 저장소 → **Settings** → 좌측 **Pages**
2. Source: **Deploy from a branch**
3. Branch: **main** / Folder: **/ (root)**
4. Save 클릭

약 1–2분 후 `https://YOUR_USER.github.io/ai-security-lab/` 에서 접속 가능.

---

## Step 4 — Colab 링크 업데이트

`index.html` 안의 두 군데 링크를 본인 저장소에 맞게 수정:

```
https://colab.research.google.com/github/YOUR_GITHUB_USER/YOUR_REPO/blob/main/Day3/...
                                          ^^^^^^^^^^^^^^^^  ^^^^^^^^^
```

`YOUR_GITHUB_USER` → 본인 GitHub 사용자 이름
`YOUR_REPO`        → 저장소 이름 (예: ai-security-lab)

---

## 대안: fly.io (서버 필요 시)

정적 페이지라면 GitHub Pages로 충분하지만,
향후 API 프록시·백엔드가 필요하면 fly.io 사용:

```bash
npm install -g @flydotio/fly
fly launch
fly deploy
```
