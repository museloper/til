## Linux 환경에 Java 설치하기

### 설치 환경

> **Operating System**: Debian GNU/Linux 12 (bookworm)  
> **Kernel**: Linux 6.1.0-rpi7-rpi-v8  
> **Architecture**: arm64

<br />

### open-jdk 설치

스프링부트 실행을 위해 `open-jdk 17` 버전을 설치할 계획이다.

```sh
# 최신 버전 사용을 위한 apt 업데이트
$ sudo apt update
$ sudo apt upgrade

# 설치
$ sudo apt i openjdk-17-jdk

# 설치 후 확인은 필수
$ java -version
openjdk version "17.0.10"
```

<br />

### 환경변수 설정

```sh
$ sudo vi /etc/environment
```

```
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

# 패키지 매니저를 통해 설치하게 되면 기본 경로는 아래와 같다.
JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
```

<br />

### 환경변수 적용

```sh
$ source /etc/environment

# 잘 적용 되었는지 확인은 필수
$ echo $JAVA_HOME
/usr/lib/jvm/java-17-openjdk-arm64
```

<br />

### 설치 끗✌️
