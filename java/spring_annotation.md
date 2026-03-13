## Spring 어노테이션 (Annotation)

👉 Spring은 어노테이션 기반으로 동작하며, 설정 파일 없이 어노테이션만으로 대부분의 기능을 구현할 수 있다.

<br>

### 1. 빈(Bean) 등록 어노테이션

> 클래스를 Spring 컨테이너에 빈으로 등록할 때 사용한다.

| Annotation        | Description                                        |
| ----------------- | -------------------------------------------------- |
| `@Component`      | 일반적인 스프링 빈 등록                           
| `@Controller`     | MVC 패턴에서 컨트롤러 역할의 빈       
| `@RestController` | `@Controller` + `@ResponseBody`, REST API용 컨트롤러
| `@Service`        | 비즈니스 로직을 담당하는 빈                   
| `@Repository`     | 데이터 접근 계층(DAO)을 담당하는 빈  
| `@Configuration`  | 설정 클래스임을 명시, `@Bean` 메서드를 포함할 수 있다
| `@Bean`           | 메서드 반환값을 스프링 빈으로 등록

```java
@Configuration
public class AppConfig {

  @Bean
  public MyService myService() {
    return new MyService();
  }
}
```

<br>

### 2. 의존성 주입(DI) 어노테이션

> 스프링 컨테이너가 빈을 자동으로 주입할 때 사용한다.

| Annotation   | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| `@Autowired` | 타입(Type)을 기준으로 빈을 자동 주입
| `@Qualifier` | `@Autowired`와 함께 사용, 동일 타입 빈이 여러 개일 때 이름으로 지정
| `@Primary`   | 동일 타입 빈이 여러 개일 때 우선적으로 주입될 빈을 지정
| `@Value`     | `application.properties`의 값을 필드에 주입

```java
@Service
public class OrderService {

  private final PaymentService paymentService;

  @Autowired // 생성자 주입 (생략 가능)
  public OrderService(PaymentService paymentService) {
    this.paymentService = paymentService;
  }
}
```

```java
@Component
public class AppInfo {

  @Value("${app.name}")
  private String appName;

  @Value("${app.version}")
  private String version;
}
```

<br>

### 3. 요청 매핑 어노테이션

> HTTP 요청을 특정 메서드에 매핑할 때 사용한다.

| Annotation       | HTTP Methods | Description    |
| ---------------- | ------------ | -------------- |
| `@RequestMapping`| ALL          | URL 패턴 매핑
| `@GetMapping`    | GET          | 데이터 조회
| `@PostMapping`   | POST         | 데이터 생성
| `@PutMapping`    | PUT          | 데이터 전체 수정
| `@PatchMapping`  | PATCH        | 데이터 부분 수정
| `@DeleteMapping` | DELETE       | 데이터 삭제

```java
@RestController
@RequestMapping("/api/users")
public class UserController {

  @GetMapping("/{id}")
  public User getUser(@PathVariable Long id) {
    return userService.findById(id);
  }

  @PostMapping
  public User createUser(@RequestBody UserDto dto) {
    return userService.create(dto);
  }

  @DeleteMapping("/{id}")
  public void deleteUser(@PathVariable Long id) {
    userService.delete(id);
  }
}
```

<br>

### 4. 요청 파라미터 어노테이션

> 컨트롤러 메서드에서 요청 데이터를 받을 때 사용한다.

| Annotation        | Description                            |
| ----------------- | -------------------------------------- |
| `@PathVariable`   | URL 경로의 변수 값을 매핑 (`/users/{id}`)
| `@RequestParam`   | 쿼리 파라미터 값을 매핑 (`?name=홍길동`)
| `@RequestBody`    | HTTP 요청 본문(JSON)을 객체로 변환
| `@RequestHeader`  | HTTP 요청 헤더 값을 매핑
| `@ModelAttribute` | 폼 데이터를 객체로 바인딩

```java
@GetMapping("/search")
public List<User> search(
  @RequestParam String name,
  @RequestParam(defaultValue = "1") int page
) {
  return userService.search(name, page);
}
```

<br>

### 5. 트랜잭션 어노테이션

> 데이터베이스 트랜잭션을 선언적으로 관리할 때 사용한다.

> `@Transactional`이 붙은 메서드는 예외 발생 시 자동으로 **롤백(rollback)**된다.

```java
@Service
public class AccountService {

  @Transactional
  public void transfer(Long fromId, Long toId, int amount) {
    accountRepository.decrease(fromId, amount);
    accountRepository.increase(toId, amount); // 예외 시 위 작업도 롤백
  }

  @Transactional(readOnly = true) // 조회 전용, 성능 최적화
  public Account findById(Long id) {
    return accountRepository.findById(id);
  }
}
```

<br>

### 6. 유효성 검증 어노테이션

> 요청 데이터를 검증할 때 사용한다. (`spring-boot-starter-validation` 필요)

| Annotation    | Description              |
| ------------- | ------------------------ |
| `@NotNull`    | null 불허
| `@NotBlank`   | null, 빈 문자열, 공백 불허
| `@NotEmpty`   | null, 빈 문자열 불허
| `@Size`       | 문자열/컬렉션 크기 범위 지정
| `@Min` / `@Max` | 숫자 최솟값 / 최댓값 지정
| `@Email`      | 이메일 형식 검증
| `@Pattern`    | 정규식 패턴 검증

```java
public class UserDto {

  @NotBlank(message = "이름은 필수입니다.")
  private String name;

  @Email(message = "올바른 이메일 형식이 아닙니다.")
  private String email;

  @Min(value = 0, message = "나이는 0 이상이어야 합니다.")
  @Max(value = 150, message = "나이는 150 이하여야 합니다.")
  private int age;
}
```

```java
@PostMapping
public User createUser(@Valid @RequestBody UserDto dto) {
  return userService.create(dto);
}
```
