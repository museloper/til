## ✅✅✅ 이 문서는 Options API 방식으로 작성된 튜토리얼 입니다. ✅✅✅

### Vue SFC ( `Single File Component` )

SFC는 HTML, CSS, JavaScript를 캡슐화한 코드 블록으로 재사용 가능한 `.vue` 파일이다. 

<br />

### 선언적 렌더링

[선언전 렌더링](https://w538xq-5173.csb.app/tutorial/01)

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

### 속성 바인딩

[속성 바인딩](https://w538xq-5173.csb.app/tutorial/02)

Vue에서 이중 중괄호는 텍스트 삽입에만 사용된다. 속성을 동적 값에 바인딩 하려면 `v-bind` 디렉티브를 사용해야 한다. 

```vue
<div v-bind:id="dynamicId"></div>
```

**디렉티브**는 `v-` 접두사로 시작하는 특수한 속성으로 Vue 템플릿 문법의 일부이다. 

**이중 중괄호 문법**과 유사하게 디렉티브 값은 컴포넌트의 `state`에 접근할 수 있다. 

```vue
<template>
  <h1 v-bind:class="titleClass">I am "RED"</h1>
</template>

<script>
export default {
  data() {
    return {
      titleClass: 'title'
    }
  }
}
</script>

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

[이벤트 리스너](https://w538xq-5173.csb.app/tutorial/03)

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

<br />

### 폼(form) 바인딩

[폼(form) 바인딩](https://w538xq-5173.csb.app/tutorial/04)

`v-bind`와 `v-on`을 함께 사용하면, 양방향 바인딩을 만들 수 있다. 

```vue
<template>
  <input :value="text" @input="onInput">
  <p>{{ text }}</p>
</template>

<script>
  data() {
    return {
        text: ''
    }
  },

  methods: {
    // v-on 핸들러는 네이티브 DOM 이벤트를 인자로 받는다. 
    onInput(event) {
      this.text = event.target.value
    }
  }
</script>
```

<br />

### 폼(form) 바인딩 2

[폼(form) 바인딩 2](https://w538xq-5173.csb.app/tutorial/05)

Vue는 양방향 바인딩을 단순화하기 위해, 위의 문법을 간편 표기하는 `v-model` 디렉티브를 제공한다. 

```vue
<template>
  <input v-model="text">
  <p>{{ text }}</p>
</template>

<script>
  data() {
    return {
        text: ''
    }
  }
</script>
```

<br />

### 조건부 렌더링

[조건부 렌더링](https://w538xq-5173.csb.app/tutorial/06)

엘리먼트를 조건부로 렌더링하기 위해 `v-if` 및 `v-else` 디렉티브를 사용할 수 있다. 

```vue
<!-- awesome의 값이 true 일 때와 false 일 때 나타나는 엘리먼트가 다르다. -->
<h1 v-if="awesome">Vue is awesome!</h1>
<h1 v-else>Oh no 😢</h1>
```

```vue
<template>
  <button @click="toggle">toggle</button>
  <h1 v-if="awesome">Vue is awesome!</h1>
  <h1 v-else>Oh no 😢</h1>
</template>

<script>
export default {
  data() {
    return {
      awesome: true
    }
  },

  methods: {
    toggle() {
      if(this.awesome) this.awesome = false
      else this.awesome = true
    }
  }
}
</script>
```

<br />

### 리스트 렌더링

[리스트 렌더링](https://w538xq-5173.csb.app/tutorial/07)

`v-for` 디렉티브를 사용하여 자료 배열을 엘리먼트 목록으로 렌더링할 수 있다. 

```vue
<template>
  <form @submit.prevent="addTodo">
    <input v-model="newTodo" />
    <button>할 일 추가</button>
  </form>
  <ul>
    <!-- todos 배열의 값을 순차적으로 반복하여 todo 안에 담는다. -->
    <li v-for="todo in todos" :key="todo.id">
      <!-- 여기서 todo는 현재 반복중인 배열 엘리먼트를 나타내는 **로컬 변수**이다. 즉 v-for 엘리먼트 내부에서만 엑세스 할 수 있다. -->
      {{ todo.text }}
      <button @click="removeTodo(todo)">X</button>
    </li>
  </ul>
</template>

<script lang="ts">
let id = 0

export default {
  data() {
    return {
      newTodo: '',
      // 각 todo 객체에 고유한 id를 부여한다. 
      todos: [
        { id: id++, text: 'HTML 배우기' },
        { id: id++, text: 'JavaScript 배우기' },
        { id: id++, text: 'Vue 배우기' }
      ],
    }
  },

  methods: {
    addTodo() {
      // 새로운 객체를 push 한다.
      this.todos.push({ id: id++, text: this.newTodo })
      this.newTodo = ''
    },
    
    removeTodo(todo) {
      // 배열 전체를 순차적으로 반복하며 주어진 조건식에 참인 요소들로만 배열을 재구성한다.
      this.todos = this.todos.filter((t) => t !== todo)
    }
  }
}
</script>
```

<br />

### 계산된 속성

[계산된 속성](https://w538xq-5173.csb.app/tutorial/08)

`computed` 속성은 `state`를 의존적으로 추적한다. 결과를 캐싱하고 의존성이 변경되면 자동으로 업데이트 한다. 

```vue
<template>
  <main>
    <form @submit.prevent="addTodo">
      <input v-model="newTodo" />
      <button>할 일 추가</button>
    </form>
    <ul>
      <!-- computed 내의 값이 변할 때 마다 즉각즉각 반응한다. -->
      <li v-for="todo in filteredTodos" :key="todo.id">
        <input type="checkbox" v-model="todo.done" />
        <span :class="{ done: todo.done }">{{ todo.text }}</span>
        <button @click="removeTodo(todo)">X</button>
      </li>
    </ul>
    <button @click="hideCompleted = !hideCompleted">
      {{ hideCompleted ? 'Show all' : 'Hide completed' }}
    </button>
  </main>
</template>

<script>
let id = 0

export default {
  data() {
    return {
      newTodo: '',
      hideCompleted: false,
      todos: [
        { id: id++, text: 'HTML 배우기' },
        { id: id++, text: 'JavaScript 배우기' },
        { id: id++, text: 'Vue 배우기' }
      ],
    }
  },

  computed: {
    filteredTodos() {
      // hideCompleted 가 true 이면 필터 적용, false 이면 전체 배열 노출
      return this.hideCompleted ? this.todos.filter((t) => !t.done) : this.todos
    }
  },

  methods: {
    addTodo() {
      this.todos.push({ id: id++, text: this.newTodo })
      this.newTodo = ''
    },
    removeTodo(todo) {
      this.todos = this.todos.filter((t) => t !== todo)
    }
  }
}
<script>

<style>
.done {
  text-decoration: line-through;
}
</style>
```