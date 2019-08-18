# VIPERRR
Using VIPER architecture elegantly with Realm and RxSwift

## Contents

[**1. VIPER**](#viper)

[**2. RxSwift**](#rxswift)

[**3. Realm**](#realm)

## VIPER

하나의 모듈을 기능에 따라 **5개의 레이어**로 나누어 구현하는 **아키텍처**

#### 장점

- 아키텍처를 쓰는 목적? = **관심사의 분리** = **VIPER**
- 모듈이 관심사에 따라 잘 나누어져, 어떤 기능을 어디에 구현해야 하는지 명확하게 알 수 있다.
- 동시간 협업과 테스트가 용이하다.

#### 단점

- 단순한 모듈을 만드는 일에도 소요가 큰 편이다.
- 레이어 간에 잦은 데이터 이동, 변환을 관리해야 한다.

#### 레이어

- **V** iew : 프레젠터에게 데이터를 받아 화면에 보여준다. 사용자 이벤트를 프레젠터에게 알려준다.
- **I** nteractor : 프레젠터의 요청에 따라 Entity와 통신하여, 데이터를 보내주거나 가공한다.
- **P** resenter : 뷰가 알려준 사용자 이벤트에 따라 뷰에 데이터를 보내주거나, 인터랙터에게 데이터를 요청하는 등의 처리를 해준다.
- **E** ntity : 데이터의 원본 객체를 의미한다.
- **R** outer : 모듈간의 전환을 담당한다.

#### VIPERRR에서 레이어

- **V** iew : ViewModel의 Observable을 Subscribe한다.
- **I** nteractor : Realm 데이터베이스와 통신하여, 데이터를 가공하거나 프레젠터에게 보내준다.
- **P** resenter : 인터랙터에게 요청한 데이터를 받아 ViewModel의 Observable들에게 적용, 뷰에게 이벤트를 보낸다. 뷰에서 일어나는 사용자 이벤트를 Subscribe한다.

## RxSwift
## Realm