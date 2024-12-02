---
source: https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=
created: 2022-11-24 13:00.08
updated: 2022-11-24 13:00.08
---
[본문 바로가기](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=#ct)

**[전기 공부 :)](https://m.blog.naver.com/PostList.naver?blogId=key4210&categoryNo=6&logCode=0&categoryName=%EC%A0%84%EA%B8%B0+%EA%B3%B5%EB%B6%80+%3A%29#postlist_block)**

### BJT전류제어, FET전압제어

[![[./_resources/BJT전류제어,_FET전압제어.resources/5.PNG?type=s1]]](https://m.blog.naver.com/PostList.naver?blogId=key4210)
[**꿈꾸는아이**](https://m.blog.naver.com/PostList.naver?blogId=key4210)

2018\. 8. 9. 1:30

[이웃추가](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=#)

[BJT는 전류제어? FET는 전압제어?](http://daniel00.tistory.com/entry/BJT%EB%8A%94-%EC%A0%84%EB%A5%98%EC%A0%9C%EC%96%B4-FET%EB%8A%94-%EC%A0%84%EC%95%95%EC%A0%9C%EC%96%B4)[공돌이(Engineer)/전자공학기초](http://daniel00.tistory.com/category/%EA%B3%B5%EB%8F%8C%EC%9D%B4%28Engineer%29/%EC%A0%84%EC%9E%90%EA%B3%B5%ED%95%99%EA%B8%B0%EC%B4%88) 2013.05.22 23:37

학교를 졸업한지 너무 오래되어서 일까. 요즘은 전자공학의 기초. 아니 전기의 기본개념이 많이 흐트러져 있음을 느끼곤 한다. 어쩌면 부끄러운 일일 수도 있겠으나, 불치하문( _不恥下問_) 하는 심정으로 찬찬히 정리해 보고자 한다.

주로 내 스스로 모호하게 알고있다고 생각되는 것들을 생각나는대로 정리해보고, 기회가 되면 좀더 체계적으로 정리해 볼 계획인다.

서론이 길었다.

오늘의 주제는

"BJT는 전류제어 소자이고, FET는 전압제어 소자이다"

라는 말이 도대체 무슨말인지 알아보자.

결론부터 말하자면

BJT의 제어를 위해선, 소량의 전압과 소량의 전류가 인가 되어야 하며

FET의 제어를 위해선, 소량의 전압만이 인가되면 된다.

가 더 명확한 표현이다라는 것이다.

그 이유를 풀어가보자.

내가 공부해본 바로는 FET를 먼저 알아보는 것이 위의 의미를 설명하기에 유리하므로, FET부터 설명한다.

참고로, MOSFET / BJT 등의 기호에서 화살표의 방향은

항상, P ----> N 의 방향을 가리키고 있다.

N채널 MOSFET 일 경우, P-Well(P-Substrate)에서 N-Channel의 방향으로 화살표가 그려져 있으며,

P채널 MOSFET 일 경우, P-Channel 에서 N-Well(N-Substrate) 방향으로 화살표가 그려져 있다.

PNP형 BJT의 경우, P--->N 방향으로 화살표가 들어가 있고,

NPN형 BJT의 경우, P--->N 방향으로 화살표가 나와있다.

![2565974C51A4C67703"&type=w1](https://dthumb-phinf.pstatic.net/?src="https://t1.daumcdn.net/cfile/tistory/2565974C51A4C67703"&type=w1) 

![0353135051A4C6A81C"&type=w1](https://dthumb-phinf.pstatic.net/?src="https://t1.daumcdn.net/cfile/tistory/0353135051A4C6A81C"&type=w1)

아래 그림은 FET의 내부 구조도이다.

 B는 Body를 의미하며, P또는 N타입 물질로 채워져있다. Substrate(기판)으로도 불린다.

![21324934519CD4FA12"&type=w1](https://dthumb-phinf.pstatic.net/?src="https://t1.daumcdn.net/cfile/tistory/21324934519CD4FA12"&type=w1)

채널 형성과정에 대하며 살펴보자.

아래 그림중, N-채널 MOSFET만 설명한다.

Gate에 +전압을 인가하면, Gate에서 Body방향으로 전기장(Electric Field)이 형성되고,

이 Electric Field에  이끌려 P타입 실리콘에 있던 전자들이 들이 Gate 근처로 모이게(concentration)

되어 N(Negative)채널을 형성하게 되고,

Drain에 더큰 +전압, Source에 -전압을 인가하면(전위차형성) 전기장이 형성되어,

Source에서는 전자를 밀어내고(repel), Drain에서는 전자를 당기게되어(attract) 전류가 흐를 수 있는 상태가 된다.

Gate에 전압은 인가 되었지만, SiO2 절연층에 의해 Gate방향으로 전류는 흐르지 않고

Source에서 Drain방향으로는 전자를 이동 시킬수 있는 상태가 되는것이다

(Conventional Current는 전자의 이동방향과 반대로 나타내어지므로 Id의 방향은 드레인-->소스이다) 

즉, 일정 전압만 Gate에 인가하면(Gate에 전류를 흘리지 않아도), Drain에서 Source방향으로 전류를 흐르게 할 수 있다

\==> FET가 전압제어 소자라 불리는 이유이다!!!!

![27658240519CCCC726"&type=w1](https://dthumb-phinf.pstatic.net/?src="https://t1.daumcdn.net/cfile/tistory/27658240519CCCC726"&type=w1)

BJT는 내일 다시 쓰도록 하겠다.

매우 피곤해서 이만...

정말 오랜만에 이어서 씁니다.

내일이라고 거짓말을 했네요.... 죄송

4살짜리 딸래미가 컴터를 독점하기전에 빨리 써야겠네요.

BJT는 Bipolar Junction Transistor 의 약자로 우리말로는 "쌍극성 접합 트랜지스터"라고 불려진다.

쌍극이라함은 N(negative)극과 p(Positive)극을 말한다. 정확히는 N 타입 반도체와 P타입 반도체를 의미한다.

반도체를 만들기에 가장 적절한 물질은 실리콘이다. 모래니까 이세상에 많다.

순수한 실리콘 원자는 최외각(Outer Cell)에 4개의 전자를 지니고 있다. 여기에 약간의 작업을 하면 반도체를 만들수 있다.

N타입 반도체는 다음과 같이 만들어진다.

이 순수한 실리콘 원자에, 최외각 전자가 5개인 불순물(인-Phosporus, 비소-Arsenic 등)을 주입하면(도핑이라고 한다) 실리콘 원자의 최외각 전자와 불순물의 최외각 전자가 공유결합을 하게 되고(최외각 전자 8개가 가장 안정적인 원자구조이다) 결국 1개의 전자는 공유결합을 하지 못하고 남게 된다. 이 남는 전자는 원자와 매우 약한 상태의 인력으로 결합되어 있기 때문에 향후 원자를 벗어나 이동 할 수 있다. 즉 전하를 운반할수 있는 전하캐리어(Charge Carrier)가 만들어진 것이다. 이 전자를 자유전자라 부르고 Negative Carrier이라고 한다.

아울러, P타입 반도체는 다음과 같이 만들어진다.

순수한 실리콘 원자에 , 최외각 전자가 3개인 불순물(붕소-Boron 등)을 주입하면 실리콘 원자의 최외각 전자와 불순물의 최외각 전자가 공유결합을 하게 되는데, 불순물의 최외각 전자가 3개뿐이기 때문에 3개의 공유결합만이 형성되고 한개는 공유결합의 공백이 생기게 된다. 이를 정공 또는 홀(Hole)이라 부르고 Positive Carrier이라고 한다.

실제로 홀은 이동하지 않는 가상의 개념이다. 원자에 결합된 전자가 홀을 거치며 이동하면, 마치 홀이 이동하는 것처럼 생각 할 수도 있다. (그림출처 <http://gamma0burst.tistory.com/466)>

더 자세한 반도체관련 정보는 위 링크를 참조하시길 바란다. 정말 좋은 글들이 많다.

![246C824752CFE57C3A"&type=w1](https://dthumb-phinf.pstatic.net/?src="https://t1.daumcdn.net/cfile/tistory/246C824752CFE57C3A"&type=w1)

다시 본론으로.

그래서 왜 BJT를 전류제어 소자라고 하는가???

아래 그림의 Transistor Off상태는 N/P/N 각 반도체에는 다수캐리어인 자유전자와 홀이 존재하고는 있지만 그 이동은 없는 상태 즉, 전류가 흐르지 않는 상태이다.

이때 Transistor On의 그림처럼, 베이스단에 +전압, 이미터단에 -전압을 인가하면 베이스-이미터간 Electric Field가 형성되고, 이미터단에 연결된 -전위의 척력(repel)에 의해 전자가 이동하게되고 ,또한 베이스단에 인가된 +전위의 인력(attract)에 의해 오른쪽 N타입 실리콘의 자유전자가 가운데 P타입 반도체의 홀을 거치며 베이스쪽으로 이동하게 된다. 즉 약한 베이스전류가 흐르게 된다. 하디만 아직까지 컬렉터쪽으로의 자유전자의 이동은 없다.

이때 컬렉터단에 베이스보다 더높은 +전압을 인가하면, 베이스단으로 끌려들어가는 자유전자보다 훨씬 많은 자유전자가 왼쪽 N타입 실리콘인 컬렉터단으로 이동하게 된다. 즉, 큰 컬렉터 전류(Ic)가 흐르게 된다.

(실제로 P타입 실리콘의 두께는 N타입보다 훨씬 얇기 때문에 이런 상황이 가능해진다)

정리하면, 베이스단에 작은 전류를 흘리면 , 큰 컬렉터 전류를 흘릴 수 있는 것이다.

\==> BJT가 전류제어 소자라고 불리는 이유이다. (결국은 전압이 인가되어야 전류가 흐르므로 정확한 표현은 아니다)

출처: <http://daniel00.tistory.com/11> \[공돌이(Engineer+Footballer) 세상\]

[_2_](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=#)

[공감한 사람 보러가기](https://m.blog.naver.com/SympathyHistoryList.naver?blogId=key4210&logNo=221335312730&categoryId=POST)
[댓글 _1_](https://m.blog.naver.com/CommentList.naver?blogId=key4210&logNo=221335312730) 

[**꿈꾸는아이**

자기소개를 입력하세요.](https://m.blog.naver.com/key4210)
[이웃추가](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=#)

## [이 블로그  **전기 공부 :)**  카테고리 글](https://m.blog.naver.com/PostList.naver?blogId=key4210&categoryNo=6&logCode=0#postlist_block)

[**공유 DC/DC Buck Converter의 제어전류제어기 설계 Type-1**
2018. 8. 9.

_0_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335597698)

[**안티와인드업, PI제어기**
2018. 8. 9.

_0_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335472623)

[**BJT전류제어, FET전압제어**
2018. 8. 9.

_2_

댓글 1](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730)

[**공유 미분기,적분기,DC offset**
2018. 8. 6.

_0_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221333386111)

[**8월 4일 토요일**
2018. 8. 4.

_0_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221332654325)

[_이전_](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=#) [_다음_](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=#)

## [이 블로그  인기글](https://m.blog.naver.com/PostList.naver?blogId=key4210)

[**교류 실효값, 평균값, 주파수**
2018. 11. 11.

_1_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221396353230&targetKeyword=&targetRecommendationCode=1)

[**반도체기초 VIH VIL VOH VOL NMH NML 의미**
2018. 12. 9.

_1_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221415491995&targetKeyword=&targetRecommendationCode=1)

[**담양 뚝방국수 다녀온 이야기**
2022. 11. 16.

_2_

댓글 1](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=222929818886&targetKeyword=&targetRecommendationCode=1)

[**퍼센트 임피던스 퍼온글**
2017. 3. 23.

_0_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=220965599405&targetKeyword=&targetRecommendationCode=1)

[**VDD,VCC,VEE,VSS**
2018. 12. 9.

_3_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221415483272&targetKeyword=&targetRecommendationCode=1)

[**데드타임**
2018. 7. 3.

_0_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221311699059&targetKeyword=&targetRecommendationCode=1)

[**Full 브릿지 컨버터**
2018. 7. 11.

_0_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221316900361&targetKeyword=&targetRecommendationCode=1)

[**파워포인트 이미지 크기 일괄 편집 매크로 퍼온글**
2019. 2. 17.

_0_

댓글 0](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221467932125&targetKeyword=&targetRecommendationCode=1)

[**Buck, Boost 컨버터**
2018. 6. 15.

_1_

댓글 1](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221299431226&targetKeyword=&targetRecommendationCode=1)

_이전_ [_다음_](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=#)

[맨 위로](https://m.blog.naver.com/PostView.naver?blogId=key4210&logNo=221335312730&proxyReferer=#)

[![[./_resources/BJT전류제어,_FET전압제어.resources/모웹하단배너_11월-3주_.png]]](https://campaign.naver.com/weeklydiary/)

[PC버전으로 보기](https://blog.naver.com/key4210/221335312730?viewType=pc)
