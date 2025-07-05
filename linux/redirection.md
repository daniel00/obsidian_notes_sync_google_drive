---
created: 2025-07-06 01:15:12 Sun
updated: 2025-07-06 01:15:12 Sun
tags: []
alias: []
---

created: 2025-07-06 01:15:12 Sun
updated: 2025-07-06 01:15:12 Sun

#### 리디렉션에 대해서 설명 합니다.


아래는 


```sh
#!/bin/bash

#if statement
CMD=$1

if command -v $CMD >/dev/null 2>&1; then
    echo "the command $CMD is exist"
else
    echo "the command $CMD is not exist"
fi
```
