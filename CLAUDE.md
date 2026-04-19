# 불씨 (Bulssi) — CLAUDE.md

## 프로젝트 개요
자기계발 커뮤니티 앱. 미션 인증 + 불꽃 보내기 + 방(채널) 기반 소셜 동기부여.
- 플랫폼: Flutter (iOS / Android)
- 번들 ID: com.ddoo.Bulssi
- Firebase 프로젝트: bulssi

## 아키텍처
- Clean Architecture + Feature-First 폴더 구조
- 의존 방향: presentation → domain ← data
- 상태관리: Riverpod 2.x (Provider → ViewModel → Widget)
- 라우팅: go_router (lib/core/router/app_router.dart)

## 폴더 구조 규칙
- 기능 추가 시 반드시 features/{feature}/ 하위에 data/domain/presentation/ 세 계층 유지
- 공용 위젯은 core/widgets/, 공용 유틸은 core/utils/에 위치
- 파일 하나에 클래스/타입 하나 원칙

## 네이밍 규칙
- Entity: UserEntity, MissionEntity
- Model: UserModel (Entity 상속)
- Repository 인터페이스: AuthRepository (abstract interface class)
- Repository 구현체: AuthRepositoryImpl
- DataSource 인터페이스: AuthRemoteDataSource
- DataSource 구현체: AuthRemoteDataSourceImpl
- UseCase: SignInWithEmail, CreateMission (동사+명사)
- Provider: authStateProvider, openRoomsProvider
- Page: LoginPage, HomePage
- Widget: FlameButtonWidget, StreakCounterWidget

## Firebase 구조 (Firestore)
- users/{uid} — 유저 정보 + 통계
- users/{uid}/badges — 뱃지 서브컬렉션
- missions/{id} — 미션
- verifications/{id} — 인증 내역
- rooms/{id} — 방
- flames/{id} — 불꽃 송수신 내역

## 코드 규칙
- Riverpod Provider는 각 feature/presentation/providers/ 에 위치
- Repository 구현체는 currentUserId를 생성자 주입으로 받음
- Firestore 변환은 반드시 Model 클래스의 fromFirestore/toFirestore 사용
- Force unwrap / null 단언 금지
- 디버그 로그 커밋 금지
- AsyncNotifier의 build()와 모든 액션 메서드는 try-catch로 감싸고 state = AsyncError()로 처리한다
- Dio 401 응답은 AuthInterceptor에서만 처리한다

## 주요 상수
- 하루 불꽃 제한: AppConfig.dailyFlameLimit (5개)
- 7일 스트릭 리워드: AppConfig.streakRewardDay7 (불꽃 +10개)
- 라우트 경로: AppRoutes 클래스 (lib/core/router/app_routes.dart)

## 실험 로그
- 매 실행 후 `docs/logs/<날짜>.md`에 아래 항목을 추가한다
  - 가설 / 변경한 파일 / 실행 명령어 / 결과 / 결론
- 테스트케이스 수정 전 현재 이해를 `cases/<case>.md`에 요약한다

## Debugging Rules

### 로그 기반 판단
- 눈으로 본 UI 동작이 아니라 `flutter logs` / Crashlytics를 진실의 기준으로 삼는다
- "되는 것 같다"는 표현 금지, 로그로 증명할 것

### 재현성 확보
- 버그 수정 전, 재현하는 최소 시나리오를 먼저 기록
- 실행 명령어를 항상 명시
  예) `flutter run --flavor dev --dart-define=ENV=dev`
- 수정 전후 상태를 `docs/bugs/<issue-number>.md`에 기록

### 이슈 미재현 시
- "모르겠다"로 끝내지 말고, 다음 가설을 반드시 작성한다
  예) `가설: provider가 dispose된 이후 ref.read가 호출되는 것으로 의심`
- 가설 → 검증 → 결론 사이클을 반복

## DO NOT
- Widget 안에서 직접 API 호출 금지
- Provider끼리 순환 참조 금지
- ViewModel에서 BuildContext 직접 참조 금지
  단, GoRouter 등 ref로 주입 가능한 경우는 허용
- View body 300줄 초과 금지 (컴포넌트 분리)
- 주석 처리된 dead code 커밋 금지
- 비밀키 / 토큰 / API Key 하드코딩 금지
