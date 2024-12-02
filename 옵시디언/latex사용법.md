---
tags: -latex -latex suite -css -fontsize
created: 2024-11-03 21:59.08
updated: 2024-11-03 22:39.46
---

### LaTex
수식 입력기

아래처럼 달러로 감싸고 Latex 문법에 맞게 수식을 적으면 된다.

```text
$$ ... $$
```

```latex
$$
E=mc^{2}
$$
```

$$
E=mc^{2}
$$


### Latex Suite
Latex 수식 입력을 편하게 해주는 플러그인도 있는데,
나는  Latex Suite 를 사용하고 있다.

입력모드에서(나는 vim을 사용하기 때문에) 
```txt
dm
```
을 입력하면 수식 입력 모드가 되고, (display math mode)
미리 등록된 latex snippet(코드조각)을 사용하거나, 본인이 직접 snippet을 등록해도 된다.

아래는 E=mc2을 latex suite를 이용해서 입력하는 방법이다.
```txt
E=mcsr
```
csr 은 c squart root를 의미한다.
이런 식으로 사칙연산, 행렬, 벡터, 미분, 적분 등의 수식을 입력 할 수 있다.

자세한 내용은 latex suite 리포지토리를 참고하세요.

https://github.com/artisticat1/obsidian-latex-suite
