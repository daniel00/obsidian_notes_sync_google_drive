---
created: 2025-07-23 23:33:21 Wed
updated: 2025-07-23 23:33:21 Wed
tags: []
alias: []
---

created: 2025-07-23 23:33:21 Wed
updated: 2025-07-23 23:33:21 Wed

#### 로컬 저장소를 깃헙에 push 하면서 리포지토리를 만드는 방법

#### github-cli 설치
brew install gh

#### gh 로그인
```bash
gh auth login
```

#### gh로 아래처럼 push

*이미 git init 되어 있고, 커밋이 하나 이상 있다고 가정*

```bash
gh repo create <만들어질 리포지토리이름> --private --source=. --remote=origin --push
```

ex)
```bash
gh repo create myproject --private --source=. --remote=origin --push
```


