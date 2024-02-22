# [클래스와 스타일 바인딩](https://w538xq-5173.csb.app/basic/01)

### 클래스 바인딩

### `:class` 내부에 객체 `{}` 사용하기

클래스를 동적으로 전달받기 위해 **객체**를 `:class`에 전달할 수 있다.

```vue
<template>
  <div :class="{ active: isActive }"></div>
</template>

<script lang="ts">
data() {
  return {
      isActive: true,
  }
}
</script>
```

위의 구문은 `isActive` 데이터 속성의 **진위여부**에 의해 `active` 클래스의 존재 여부가 결정됨을 의미하며 아래와 같이 렌더링 된다.

```html
<div class="active"></div>
```

<br />

### `:class`와 `class`의 공존

또한 아래와 같이 `:class` 디렉티브는 일반 `class` 속성과 공존할 수 있다.

```vue
<template>
  <div class="static" :class="{ active: isActive }"></div>
</template>
```

이는 아래와 같이 렌더링 된다.

```html
<div class="static active"></div>
```

<br />

### 객체 스타일 직접 바인딩하기

전달되는 데이터를 객체로 줄 수도 있다.

```vue
<template>
  <div :class="classObject"></div>
</template>

<script lang="ts">
data() {
  return {
    classObject: {
      active: true,
      'text-danger': false
    }
  }
}
</script>
```

<br />

### 스타일 바인딩

### `:style` 내부에 객체 `{}` 사용하기

`:style`은 **HTML 엘리먼트의 `style` 속성**에 해당하는 JavaScript 객체에 대한 바인딩을 지원한다.

```vue
<template>
  <div :style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>
</template>

<script lang="ts">
data() {
  return {
    activeColor: 'red',
    fontSize: 30
  }
}
</script>
```

혹은 객체 스타일이기 때문에 다음과 같이 사용할 수도 있다.

```vue
<template>
  <!-- key, value가 동일하게 사용되는 스타일 -->
  <p :style="{ color }" @click="toggleColor">
    This should be green, and should toggle between green and blue on click.
  </p>
</template>

<script lang="ts">
data() {
  return {
    color: 'green'
  }
},

methods: {
  toggleColor() {
    this.color = this.color === 'green' ? 'blue' : 'green'
  }
}
</script>
```

<br />

### 객체 스타일 직접 바인딩하기

```vue
<template>
  <div :style="styleObject"></div>
</template>

<script lang="ts">
data() {
  return {
    styleObject: {
      color: 'red',
      fontSize: '13px'
    }
  }
}
</script>
```

<br />

### `camelCase` & `kebab-case`

`:style`에 사용될 CSS 속성에 해당하는 키 문자열은 `camelCase`가 권장되지만, `kebab-case`도 지원한다.

```vue
// camelCase
<template>
  <div :style="{ fontSize: fontSize + 'px' }"></div>
</template>
```

```vue
// kebab-case
<template>
  <div :style="{ font-size: fontSize + 'px' }"></div>
</template>
```
