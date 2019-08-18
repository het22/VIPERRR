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

**Reactive Programming**을 지원하기 위한 **Swift 라이브러리**

#### 반응형 프로그래밍

**비동기적인 데이터의 흐름**을 다루는 프로그래밍 패러다임

- 동기적인 데이터 흐름 처리

  ```pseudocode
  // make the call, assign its return value to `returnVal`
  returnVal = someMethod(itsParameters);
  // do something useful with returnVal
  ```

- 비동기적인 데이터 흐름 처리

  ```pseudocode
  // defines, but does not invoke, the Subscriber's onNext handler
  // (in this example, the observer is very simple and has only an onNext handler)
  def myOnNext = { it -> do something useful with it };
  // defines, but does not invoke, the Observable
  def myObservable = someObservable(itsParameters);
  // subscribes the Subscriber to the Observable, and invokes the Observable
  myObservable.subscribe(myOnNext);
  // go on about my business
  ```

#### Observable

- 비동기적으로 Element를 받을 수 있는 Sequence

- Observer가 구독할 수 있는 객체

  ```swift
  class Observable<Element> {
      func subscribe(_ observer: Observer<Element>) -> Disposable
  }
  ```

#### Observer

- Event를 처리하는 행위

- Observable을 구독하고 Obeservable이 방출하는 Event를 받는 구조체

  ```swift
  protocol ObserverType {
      func on(_ event: Event<Element>)
  }
  
  struct Observer<Element> : ObserverType {
  		typealias EventHandler = (Event<Element>) -> Void
  		private let observer: EventHandler
  		init(eventHandler: @escaping EventHandler) {
          self.observer = eventHandler
      }
  }
  ```

#### Event

- Observable이 방출하는 열거형 케이스

  ```swift
  enum Event<Element>  {
      case next(Element)      // next element of a sequence
      case error(Swift.Error) // sequence failed with error
      case completed          // sequence terminated successfully
  }
  ```



## Realm



## Reference

[RxSwift Getting Started](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/GettingStarted.md)

[ReactiveX Observable](http://reactivex.io/documentation/observable.html)