---
created: 2026-01-19 23:21:24 Mon
updated: 2026-01-19 23:21:24 Mon
tags: [surround, vim-surround, ysiw]
alias: []
---

created: 2026-01-19 23:21:24 Mon
updated: 2026-01-19 23:21:24 Mon

####  lazyvim에 vim-surround를 설치하여 사용하는 방법을 정리 합니다.


lazyvim의 디폴트 mini.surround는 사용하기 불편한다. gsa가 제대로 동작을 안한다. 다른 키와 중복인지도 모르겠지만.
그래서 그동안 손에 익었던 vim-surround를 설치했다.


##### 설치방법

plugins 폴더에 vim-surround.lua 파일 추가
아래처럼 입력 후 :Lazy<엔터> 또는 lazyvim 재시작

```lua
return {
  -- 전통적인 vim-surround 추가
  { "tpope/vim-surround" },
}

```

##### 사용법
hello 단어 위에서

ysiw {   :  {hello}
ds{         : hello
yss"       : 