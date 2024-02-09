## Vim 함수 사용하기

### 함수 정의

**vim 편집기** 내에서 `사용자 정의 함수`를 사용하기 위해서는 `~/.vimrc` 내의 내용을 편집해야 한다.

아래와 같이 `vi` 혹은 `vim` 편집기로 `~/.vimrc` 파일을 수정한다.

```sh
# 사용자의 ~/.vimrc 문서를 편집한다.
$ vi ~/.vimrc
#혹은
$ vim ~/.vimrc
```

```vim
" ~/.vimrc

" mapleader 단축키를 [\]에서 [,]로 변경한다.
let mapleader=","

function! Count()
    " 정규식을 통하여 매칭되는 라인 수를 셀 수 있다.
    execute '%s/^- \[//n'
endfunction

" <leader>c 명령어를 통하여 정의된 Count() 함수를 호출한다.
" 원래는 \ + c 버튼으로 함수를 실행하나,
" 이제는 , + c 버튼으로 함수를 실행한다.
nnoremap <leader>c :call Count()<cr>
```

<br />

### 함수 사용

**vim 편집기**로 `README.md` 파일을 편집한다고 가정했을 때

아래와 같이 `vim` 편집기를 실행한다.

```sh
$ vim README.md
```

```md
### 카테고리

- [Vim](#vim)

---

### Vim

- [Vim 함수 사용하기](./vim/use_function.md)
```

위와 같이 글이 작성되어 있는 상황에서 `,` + `c` 버튼을 누르면 `~/.vimrc` 내에 정의된 함수를 호출하여 다음과 같은 결과를 보여준다.

```vim
README.md [dos]
1 match on 1 line
```
