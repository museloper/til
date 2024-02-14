### Vue SFC ( `Single File Component` )

SFC는 HTML, CSS, JavaScript를 캡슐화한 코드 블록으로 재사용 가능한 `.vue` 파일이다. 

<br />

### 선언적 렌더링

Vue의 핵심 기능은 **선언적 렌더링**이다. 

HTML을 확장하는 템플릿 문법을 사용하여 JavaScript `state`를 기반으로 HTML이 어떻게 보이는지 설명할 수 있다. 

`state`가 변경되면 HTML이 자동으로 업데이트(Re Rendering)된다. (반응형)

```vue
<template>
  <!-- 템플릿에서 message 속성을 사용할 수 있다. -->
  <!-- 이중 중괄호 문법을 사용하여 message 값을 동적으로 렌더링한다. -->
  <h1>{{ message }}</h1>
</template>

<script>
export default {
    
  // 컴포넌트에서 객체를 반환해야하는 함수 data 옵션을 사용하여 반응형 state를 선언할 수 있다. 
  // 이 state가 업데이트 되는 즉시 HTML 에서도 값이 업데이트 된다. (반응형)
  data() {
      return {
        message: 'Hello Vue!'
    }
  }
}
</script>
```

이중 중괄호 내부에서 유효한 JavaScript 표현식을 사용할 수도 있다. 

```vue
<h1>{{ message.split('').reverse().join('') }}</h1>
```

<br />

### 속성 바인딩

Vue에서 이중 중괄호는 텍스트 삽입에만 사용된다. 속성을 동적 값에 바인딩 하려면 `v-bind` 디렉티브를 사용해야 한다. 

```vue
<div v-bind:id="dynamicId"></div>
```

**디렉티브**는 `v-` 접두사로 시작하는 특수한 속성으로 Vue 템플릿 문법의 일부이다. 

**이중 중괄호 문법**과 유사하게 디렉티브 값은 컴포넌트의 `state`에 접근할 수 있다. 

```vue
<script>
export default {
  data() {
    return {
      titleClass: 'title'
    }
  }
}
</script>

<template>
  <h1 v-bind:class="titleClass">I am "RED"</h1>
</template>

<style>
.title {
  color: red;
}
</style>
```

이 디렉티브는 **약어**가 존재하는데 다음과 같이 `v-bind`를 생략할 수 있다. 

```vue
<!-- BEFORE -->
<template>
  <h1 v-bind:class="titleClass">I am "RED"</h1>
</template>

<!-- AFTER -->
<template>
  <h1 :class="titleClass">I am "RED"</h1>
</template>
```

이 외에도 디렉티브 약어는 몇 종류가 있는데 아마 후술할 기회가 있을 것이다. 

<br />

### 이벤트 리스너

`v-on` 디렉티브를 사용하여 DOM 이벤트를 수신할 수 있다. 

```vue
<button v-on:click="increment">{{ count }}</button>
```

이 디렉티브의 경우에도 **약어**가 존재하는데 약어를 사용한 코드는 다음과 같다. 

```vue
<button @click="increment">{{ count }}</button>
```

여기서 참조되는 `increment`는 `methods` 옵션을 사용하여 선언된 함수이다. 

```vue
<script>
export default {
  data() {
    return {
      count: 0
    }
  },

  methods: {
    increment() {
      // this를 통하여 현재의 Vue 객체(컴포넌트)에 접근할 수 있다. 
      // 컴포넌트의 count 업데이트
      this.count++
    }
  }
}
</script>
```