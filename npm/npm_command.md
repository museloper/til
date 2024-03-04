## NPM 명령어 정리

### 프로젝트 초기화

```sh
$ npm init
```

<br />

### `package.json`의 패키지 설치

```sh
$ npm install
$ npm -i
```

<br />

### 패키지를 프로젝트 의존성으로 추가

```sh
# default option
$ npm install --save [패키지명]
$ npm i --save [패키지명]

# --save가 기본 옵션이기 때문에 위의 명령어나 아래의 명령어나 다를바가 없다.
$ npm install [패키지명]
$ npm i [패키지명]
```

<br />

### 패키지를 프로젝트 개발 의존성 수준으로 추가

```sh
npm install --save-dev [패키지명]
npm install --D [패키지명]

npm i --save-dev [패키지명]
npm i -D [패키지명]
```

<br />

### 패키지를 전역 수준으로 추가

```sh
$ npm install --global [패키지명]
$ npm install -g [패키지명]

$ npm i --global [패키지명]
$ npm i -g [패키지명]
```

<br />

### 패키지 업데이트

```sh
$ npm update --save
$ npm update
```

<br />

### `package.json`의 스크립트 명령 실행

```sh
$ npm run [스크립트명]
```
