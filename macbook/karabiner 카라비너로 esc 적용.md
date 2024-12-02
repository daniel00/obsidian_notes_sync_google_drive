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