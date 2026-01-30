---
created: 2026-01-18 14:07:08 Sun
updated: 2026-01-18 14:07:08 Sun
tags: [private, github, repo, public]
alias: []
---

created: 2026-01-18 14:07:08 Sun
updated: 2026-01-18 14:07:08 Sun

####  github 리포지토리를 private로 설정하는 방법

github cli 모드에서 일괄 처리하는게 가장 편하다.

```bash
# --visibility=public으로 필터링하고, --visibility=private으로 변경
for repo in $(gh repo list --visibility=public --limit 1000 --json name -q '.[].name'); do
  echo "Changing $repo to private..."
  gh repo edit "$repo" --visibility=private
done
```

