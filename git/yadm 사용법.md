---
created: 2025-07-05 01:07
updated: 2025-07-05 01:07
tags: []
alias: []
---

created: 2025-07-05 01:07
updated: 2025-07-05 01:07

##### yadm status에서 변경된 파일만 커밋 하려면,

```bash
yadm add -u
yadm commit -m "some changed"
```


### yadm은 여러 config 파일을 관리하는 툴이다.
예를들어 vim의 .vimrc, hammerspoon 셋업파일인 init.lua, vscode setting.json 등의 파일을 일일이 관리하기가 매우 번거롭다.  
이 파일들을 github에 올려놓고, 관리하도록 도와주는 툴이 yadm이다.

원리는,
여러 경로에 흩어진 파일들도 하나의 리포지토리에 등록하고, 
다시 clone할때 원래의 경로에 저장 되도록 하는 것이다.

주요 커맨드는 다음과 같다.
yadm init
yadm add    
ex) yadm  add .vimrc, yadm add init.lua, yadm add setting.json
yadm commit

yadm remote add origin <url>
yadm push -u origin <local branch>:<remote branch>

yadm clone <url>
yadm status   

[yadm official]( https://yadm.io/docs/getting_started# )




