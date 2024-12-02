---
title: "옵시디언 심화: LaTeX"
source: https://kaminik.tistory.com/entry/%EC%98%B5%EC%8B%9C%EB%94%94%EC%96%B8-%EC%8B%AC%ED%99%94-LaTeX
author:
  - "[[제이닉]]"
published: 2024-02-04
created: 2024-11-03
description: obsidian 활용법, 옵시디언, 지식관리방법론, 제2의뇌, 노트관리방법론, 세컨드브레인
tags:
  - clippings
updated: 2024-11-03 21:37.10
---
---

## 개요

옵시디언에서 LaTeX을 사용하면 복잡한 수학식을 깔끔하고 정확하게 문서에 표현할 수 있습니다. 옵시디언은 LaTeX 수식을 지원하여 복잡한 수학식을 쉽게 작성하고 관리할 수 있습니다.

---

## LaTeX란?

LaTeX은 고급 문서 조판 시스템으로, 학술 문서, 기술 문서, 과학 및 수학 관련 문서를 포함한 다양한 유형의 문서를 만드는 데 주로 사용됩니다. 특히 수학적 공식, 표, 그림, 참조 등 복잡한 요소를 포함한 문서를 정교하게 구성할 수 있도록 설계되었습니다.

> [
> 
> ![LaTeX - A document preparation system](https://tistory3.daumcdn.net/tistory/921054/skin/images/thumb.webp)
> 
> LaTeX - A document preparation system
> 
> LaTeX – A document preparation system LaTeX is a high-quality typesetting system; it includes features designed for the production of technical and scientific documentation. LaTeX is the de facto standard for the communication and publication of scientif
> 
> www.latex-project.org
> 
> 
> 
> ](https://www.latex-project.org/)

---

## LaTeX 사용 방법

### 인라인(Inline) 수식

```ruby
  $E=mc^2$ → E=mc²
```

문장 내에서 수식을 사용할 때는 `$...$`를 사용합니다.

```ruby
  원의 둘레는 대략 $2\pi r$입니다.
```

### 블록(Block) 수식

독립된 수식 줄을 만들고 싶을 때는 `$$...$$`를 사용합니다.

```ruby
  $$
\frac{-b \pm \sqrt{b^2-4ac}}{2a}
$$
```

근의 공식이 문서에 독립된 줄로 표시됩니다.

```ruby
  $$
\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}
$$
```

행렬이 문서에 표시됩니다.

---

## LaTex 기본 문법

옵시디언에서 사용할 수 있는 Latex 기본 문법입니다. 

**지수와 지수함수**

```ruby
  $$x^{n}$$
```

`n`의 지수를 가진 `x`.

**루트 및 n번째 루트**

```ruby
  $$\sqrt{x}$$
$$\sqrt[n]{x}$$
```

`x`의 제곱근과 `x`의 `n`번째 루트.

### 분수와 비율

**기본 분수**

```ruby
  $$\frac{a}{b}$$
```

`a`를 `b`로 나눈 값.

**연달아진 분수**

```ruby
  $$\frac{\frac{a}{b}}{\frac{c}{d}}$$
```

분수 위의 분수를 표현.

### 적분과 미분

**정적분**

```ruby
  $$\int_a^b f(x) \, dx$$
```

`a`부터 `b`까지 `f(x)`의 정적분.

**부정적분**

```java
  $$\int f(x) \, dx$$
```

`f(x)`의 부정적분.

**미분**

```ruby
  $$\frac{d}{dx}f(x)$$
```

`f(x)`에 대한 `x`의 미분.

### 시그마 표기법과 제품 표기법

**시그마 표기법(합계)**

```ruby
  $$\sum_{i=1}^{n} i$$
```

1부터 `n`까지의 합.

**제품 표기법**

```ruby
  $$\prod_{i=1}^{n} i$$
```

1부터 `n`까지의 곱.

### 행렬

**기본 행렬**

```ruby
  $$\begin{matrix}
a & b \\
c & d
\end{matrix}$$
```

2x2 행렬.

**괄호가 있는 행렬**

```ruby
  $$\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}$$
```

괄호를 사용한 2x2 행렬.

### 그리스 문자

**소문자 그리스 문자**

```ruby
  $$\alpha, \beta, \gamma, \theta, \lambda$$
```

**대문자 그리스 문자**

```ruby
  $$\Gamma, \Delta, \Theta, \Lambda, \Omega$$
```

### 고급 기능

**위/아래 첨자 동시 사용**

```ruby
  $$x_i^2$$
```

`i`번째 `x`의 제곱.

**한계값**

```ruby
  $$\lim_{x \to \infty} f(x)$$
```

`x`가 무한대로 갈 때 `f(x)`의 한계값.

---

## 관련 플러그인

> [
> 
> ![LaTeX 수식을 빠르게 입력하는 Latex suite 플러그인](https://scrap.kakaocdn.net/dn/FaeQ6/hyVM0wxdRk/lTRJFRr5Zl7kKIO6elkUTk/img.jpg?width=800&height=449&face=0_0_800_449,https://scrap.kakaocdn.net/dn/bx4hCk/hyVMNjFlcY/xkYnjvJuyhliXiCUJdDk50/img.jpg?width=800&height=449&face=0_0_800_449,https://scrap.kakaocdn.net/dn/clWAb2/hyVM0XCMo2/8hfU4PU1jKlGoW8niZkRQ1/img.png?width=3773&height=1259&face=0_0_3773_1259)
> 
> LaTeX 수식을 빠르게 입력하는 Latex suite 플러그인
> 
> 개요 LaTeX Suite는 옵시디언에서 LaTeX 수식을 손글씨만큼 빠르게 입력할 수 있도록 도와주는 플러그인입니다. Plugin Info 플러그인 명 LaTeX Suite 플러그인 설명 LaTeX 수식을 빠르게 입력 플러그인 분류
> 
> kaminik.tistory.com
> 
> 
> 
> ](https://kaminik.tistory.com/entry/LaTeX-%EC%88%98%EC%8B%9D%EC%9D%84-%EB%B9%A0%EB%A5%B4%EA%B2%8C-%EC%9E%85%EB%A0%A5%ED%95%98%EB%8A%94-Latex-suite-%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8)

> [
> 
> ![LaTex 환경을 삽입하거나 변경하는 LaTex Environments 플러그인](https://scrap.kakaocdn.net/dn/hdtPk/hyVMOJDmO6/2kXKwCYuIxktiu5chjnp61/img.jpg?width=800&height=449&face=0_0_800_449,https://scrap.kakaocdn.net/dn/b4s6Oj/hyVMP2R7vu/abB2c2lIUyTA9UPAj4Mp2K/img.jpg?width=800&height=449&face=0_0_800_449)
> 
> LaTex 환경을 삽입하거나 변경하는 LaTex Environments 플러그인
> 
> 개요 LaTex Environments는 LaTex 환경을 삽입하거나 변경하는 플러그인입니다. Plugin Info 플러그인 명 LaTex Environments 플러그인 설명 LaTex 환경을 삽입하거나 변경 플러그인 분류 입력 지원, 수식 Github 링
> 
> kaminik.tistory.com
> 
> 
> 
> ](https://kaminik.tistory.com/entry/LaTex-%ED%99%98%EA%B2%BD%EC%9D%84-%EC%82%BD%EC%9E%85%ED%95%98%EA%B1%B0%EB%82%98-%EB%B3%80%EA%B2%BD%ED%95%98%EB%8A%94-LaTex-Environments-%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8)

> [
> 
> ![LaTeX, Frontmatter 등에 자동 완성 기능을 제공하는  Completr 플러그인](https://scrap.kakaocdn.net/dn/gHoWa/hyVDupXDAp/YO0jGkw7TZNYpUcYbpZB6K/img.jpg?width=800&height=449&face=0_0_800_449,https://scrap.kakaocdn.net/dn/bjPPKR/hyVDGRsPkF/UomQNqHVQ7H5M63vn9qqP1/img.jpg?width=800&height=449&face=0_0_800_449,https://scrap.kakaocdn.net/dn/baXS6w/hyVDFZkUDh/7CLD8pTrpD5TOsEyfvoFF0/img.png?width=595&height=582&face=0_0_595_582)
> 
> LaTeX, Frontmatter 등에 자동 완성 기능을 제공하는 Completr 플러그인
> 
> 개요 Completr는 LaTeX, Frontmatter, Callout의 자동 완성 기능을 제공하는 플러그인입니다. 또한 현재 파일의 모든 텍스트를 스캔하여 자동 완성 대상 텍스트로 사용하는 기능도 제공합니다. Plugin Info 플
> 
> kaminik.tistory.com
> 
> 
> 
> ](https://kaminik.tistory.com/entry/LaTeX-Frontmatter-%EB%93%B1%EC%97%90-%EC%9E%90%EB%8F%99-%EC%99%84%EC%84%B1-%EA%B8%B0%EB%8A%A5%EC%9D%84-%EC%A0%9C%EA%B3%B5%ED%95%98%EB%8A%94-Completr-%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8)

---