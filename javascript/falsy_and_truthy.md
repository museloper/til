## Falsy와 Truthy

👉 자바스크립트에서는 `false` 처럼 동작하는 값들을 **Falsy** 라고 한다.  
👉 반대로 `true` 처럼 동작하는 값들을 **Truthy** 라고 한다.

<br>

### Truthy와 Falsy 비교

| Falsy       | Truthy                      |
| ----------- | --------------------------- |
| `false`     | `true`                      |
| `0`         | `1`, `-1`, `3.14` ...       |
| `''`        | `'hello'`, `'0'`, `'false'` |
| `null`      | `{}`, `[]`                  |
| `undefined` | `function() {}`             |
| `NaN`       |                             |

<br>

### Truthy와 Falsy 출력 예제

```javascript
if (true) {
  console.log(true, 'Truthy')
}

if (3.14) {
  console.log(3.14, 'Truthy')
}

if ('3.14') {
  console.log('3.14', 'Truthy')
}

if ([]) {
  console.log([], 'Truthy')
}

if ({}) {
  console.log({}, 'Truthy')
}

if (function () {}) {
  console.log(function () {}, 'Truthy')
}

if (!false) {
  console.log(false, 'Falsy')
}

if (!0) {
  console.log(0, 'Falsy')
}

if (!'') {
  console.log('', 'Falsy')
}

if (!null) {
  console.log(null, 'Falsy')
}

if (!undefined) {
  console.log(undefined, 'Falsy')
}

if (!NaN) {
  console.log(NaN, 'Falsy')
}
```
