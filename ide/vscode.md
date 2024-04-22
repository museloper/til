### 타입스크립트 설정

```json
// .vscode/setting.json
{
  "Javascript.implictProjectConfig.checkJs": true
}
```

<br />

### 코드포맷터 설정

```json
// .vscode/settings.json
{
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true
}
```

<br />

### 프리티어 설정

```json
// .prettierrc or .pretierrc.json
{
  "trailingComma": "es5",
  "tabWidth": 2,
  "semi": false,
  "singleQuote": true
}
```

<br />

### 프리티어 - pug 설정

```bash
# install plugin
$ npm i -D prettier @prettier/plugin-pug
```

```json
// .prettierrc
{
  "plugins": ["@prettier/plugin-pug"]
}
```
