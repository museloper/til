### Linux OS 버전 확인하기

```sh
# OS 정보 확인하는 명령어 2가지
$ cat /etc/os-release
$ lsb_release -a
```

<br />

### Linux Kernel 버전 확인하기

```sh
# 커널 정보 확인하는 명령어 3가지
$ cat /proc/version
$ uname -a
$ uname -r
```

<br />

### Linux OS, Kernel 정보 한 번에 확인하기

```sh
$ hostnamectl

#  Static hostname:
#        Icon name:
#       Machine ID:
#          Boot ID:
# Operating System:
#           Kernel:
#     Architecture:
```
