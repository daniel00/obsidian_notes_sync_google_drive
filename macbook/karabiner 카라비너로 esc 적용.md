---
tags:
  - karabiner
  - esc
  - ctrl ;
  - semicolon
created: 2024-11-04 01:00.52
updated: 2024-11-28 21:32.15
---

creation date: 2024-11-28 21:21
modification date: Thursday 28th November 2024 21:21:22

맥북 "키보드" 세팅에서 CapsLock를 Control로 바꾸고 나서, 카라비너에 Control + ; 를 Esc로 동작하도록 적용했더니 동작하지 않았다.

카라비너에서 caps_lock를 left_control로 바꾸었더니 Control + ; 가 Esc로 정상 동작했다.

hammerspoon에서 ctrl ; 를 esc로 설정해서 한글->영문도 자동 저장되도록 설정해도,
lazyvim에서는 한글 상태로 남아있는 문제가 있다. 그래서 위처럼 카라비너를 이용해서 esc적용 했더니 영문 전환 까지 정상 동작한다.


아직 남은 문제.
lazyvim에서 c-h 를 설정해도 동작하지 않는다. 계속 left키로만 동작한다.
카라비너를 끄면 정상 동작한다.
뭐가 문제인지 확인 중이다.....


![[Pasted image 20241128212518.png | 1000]]



![[Pasted image 20241128212633.png | 1000]]


```json
{
    "description": "Control + ; --> Esc",
    "manipulators": [
        {
            "from": {
                "key_code": "semicolon",
                "modifiers": { "mandatory": ["control"] }
            },
            "to": [{ "key_code": "escape" }],
            "to_after_key_up": [{ "select_input_source": { "language": "en" } }],
            "type": "basic"
        }
    ]
}
```