---
created: 2026-01-18 14:07:08 Sun
updated: 2026-01-18 14:07:08 Sun
tags: [private, github, repo, public]
alias: []
---

created: 2026-01-18 14:07:08 Sun
updated: 2026-01-18 14:07:08 Sun

####  github repository to private 

```bash
# --visibility=public으로 필터링하고, --visibility=private으로 변경
for repo in $(gh repo list --visibility=public --limit 1000 --json name -q '.[].name'); do
  echo "Changing $repo to private..."
  gh repo edit "$repo" --visibility=private
done
```


