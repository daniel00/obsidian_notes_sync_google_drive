---
tags: 
created: 2024-11-04 01:00.52
updated: 2024-11-05 00:52.09
---

creation date: 2024-11-05 00:48
modification date: Tuesday 5th November 2024 00:48:22

#### 여러가지 키바인딩 방법

##### ctrl p --> cmd o
옵시디언에서 파일을 열고 찾을때 사용하는 switcher를 여는 명령어는 cmd o 이다.
cmd o를 .obsidian.vimrc에 등록해도 동작이 되지 않았다.

hammerspoon에 등록했더니 정상 동작한다.

```lua
spoon.AppBindings:bind('Obsidian', {
  { {'ctrl'}, 'p', {'cmd'}, 'o' }
})

```

##### H5