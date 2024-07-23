# Flutter

개발중인 크로스 플랫폼 사이드 프로젝트를 2024년 12월까지 출시 목표로 Flutter를 공부하는 Repository

<br>

<details>
<summary>⚒️ 개발 환경 설정</summary>

### Flutter SDK Setting

[Flutter SDK 설치](https://docs.flutter.dev/get-started/install)

- 환경변수 설정 필요
- cmd -> flutter docker 체크리스트 확인

<br>

### Android SDK & Studio Setting

[Android Studio 설치](https://developer.android.com/studio?hl=ko)

[Visual Studio Tools (C++) 설치](https://visualstudio.microsoft.com/ko/downloads)

1. **설치 후 SDK Manager에서 Andriod SDK, Android API 34 추가**
2. **SDK Tools에서 아래 Tool 설치**
- Android Command Line Tools
- NDK
- Android SDK Build-Tools
- Android Emulator
- Android SDK Platform-Tools
- Inter x86 Emulator Accelerator (HAXM installer)

3. **위 과정 전부 수행 후 cmd에 flutter-doctor 실행**
- 만약 `Android license status unknown` 에러가 뜬다면 `flutter doctor --android-licenses` 실행
- 만약 `CocoaPods not installed`가 에러가 뜬다면
4. **Dart, Flutter Plugin 설치**

<br>

### Emulator Setting

1. Flutter Project 생성
2. Tools - Device Manager - '+' 버튼(Create a new Device)
3. Pixel & PlayStore 마크가 있는 Device 선택 후 Next
4. UpsideDownCake 설치 후 설치된 Release를 선택 후 Next
5. AVD Name 정하고 하단 Show Advanced Settings 진입
6. Internal Storage Size를 적당히 변경(ex: 30GB) 후 Finish를 클릭해 Emulator 생성
7. (선택) Android Studio Setting - emulator 검색 - Launch in a tool window 체크 해제 (Emulator를 독립적인 창에서 실행)

<br>

### IntelliJ Flutter 개발 환경 세팅

- Settings - SDK 검색 - Edit 눌러 Android SDK 설치
- Flutter Plugin 설치
- Flutter SDK 설치 및 환경변수 설정
- Settings - Flutter 검색 - SDK 경로 설정
- Dark SDK 경로 지정 -> `/flutter-SDK-경로/bin/cache/dart-sdk`
- `flutter config --android-sdk [Android SDK 경로]` 입력
- `flutter doctor` 실행
- Tools - Android - Device Manager - Device 생성

<br>

### Flutter Dependency

- `flutter pub add [패키지 이름]`

</details>

---

## 👨‍💻 학습 기록

**Widget**

- [📚 Stateless & Stateful Widget](Desc/Widget/State/Stateless-Stateful.md)
- [📚 Route - 경로 & 화면 매핑](./Desc/Widget/Route/Route.md)
- [📚 Column & Row & Expanded Widget](Desc/Widget/Row-Column-Expanded/Column-Row-Expanded.md)