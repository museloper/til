## `var`와 `let`의 차이점

### 1. 스코프(Scope)의 차이

> `var`는 **함수 스코프(Function Scope)**를 갖는다.

함수 안에서 선언하면 함수 내에서만 유효하다.  
블록(`{}`) 내부에서 선언해도 블록을 무시하고 함수 스코프에 저장된다.

<br>

> `let`은 **블록 스코프(Block Scope)**를 갖는다.

블록(`{}`) 안에서 선언하면 그 블록 안에서만 유효하다.

```javascript
function example() {
  if (true) {
    var x = 10
    let y = 20
  }
  console.log(x) // 10
  console.log(y) // Uncaught ReferenceError: y is not defined
}
```

<br>

### 2. 호이스팅(Hoisting)

`var`는 선언 단계에서 `undefined`로 **초기화** 과정이 진행된다.  
`let`은 선언 단계에서 **초기화** 과정이 이루어지지 않는다.

```javascript
console.log(a) // undefined
var a = 5

console.log(b) // Uncaught ReferenceError: b is not defined
let b = 10
```

<br>

### 3. 중복 선언

`var`는 같은 스코프에서 **중복 선언 가능**  
`let`은 같은 스코프에서 **중복 선언 불가능**

```javascript
var x = 1
var x = 2

let y = 1
let y = 2 // Uncaught SyntaxError: Identifier 'y' has already been declared
```

<br>

### 4. 전역 객체(window) 등록 여부

`var`로 선언한 전역 변수는 `window`에 등록된다.  
`let`으로 선언한 전역 변수는 `window`에 등록되지 않는다.

```javascript
var a = 1
let b = 2

console.log(window.a) // 1
console.log(window.b) // undefined
```
