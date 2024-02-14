### Vue SFC ( `Single File Component` )

SFC는 HTML, CSS, JavaScript를 캡슐화한 코드 블록으로 재사용 가능한 `.vue` 파일이다. 

<br />

### 선언적 렌더링

Vue의 핵심 기능은 **선언적 렌더링**이다. HTML을 확장하는 템플릿 문법을 사용하여 JavaScript `state`를 기반으로 HTML이 어떻게 보이는지 설명할 수 있다. 

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
  data() {
      return {
        // 이 state가 업데이트 되는 즉시 HTML 에서도 값이 업데이트 된다. (반응형)
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