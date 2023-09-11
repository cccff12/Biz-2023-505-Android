# Naver OpenAPI 를 활용한 영화정보 어플

- OpenAPI 를 사용하기 위한 Dependency 도구 설치

```bash
# 2개 한 번에 설치
flutter pub add http flutter_html

# 따로 설치
flutter pub add http
flutter pub flutter_html

```

## 프로젝트 패키지 이름 변경하기

- 프로젝트를 생성할 때 기본 패키지를 잘 만들어야 한다. 패키지를 잘 못 만들면 , google play store, App Store 에 어플을 배포 할 수 없다. 패키지는 기존의 다른 어플과 완전히 다른 값으로 설정해야 한다.
- 패키지는 회사의 인터넷 홈페이지 주소와 연동하여 설정한다.
- 만약 회사의 홈페이지가 `https://www.callor.com` 라고 하면 `callor.com.어플이름` 형식으로 사용한다.
- 프로젝트를 만들 당시에 패키지를 잘못지정하거나, 지정하지 않았을 경우 개발도중에 패키지 명을 변경해야 할 필요가 있다. 이때 사용하는 도구가 있다.

패키지 이름 보는 곳: C:\Users\KMS5050002\Documents\workspace\Android\flutter-010-movie\android\app\src\main\kotlin\com\callor\movie\MainActivity.kt

- 패키지명 변경도구 :

```bash
flutter pub add change_app_package_name
```

- 패키지명 변경 :

```dart
flutter pub run change_app_package_name:main 바꿀패키지이름
```

# OpenAPI 를 사용하기 위한 Android 설정 변경

- `\android\src\main\kotlin` 폴더의 `MainActivity.kt` 파일에서 패키지명이 잘 설정되었는지 확인
- `\android\src\main\AndroidManifest.xml` 파일을 열여서 패키지 명이 잘 설정되었는지 확인
- `AndroidMainfest.xml` 파일에서 다음 항목을 찾는다

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">


    <application>
        ....

```

- 그리고 다음을 추가한다.

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <queries>
        <package android:name="com.callor.movie" />
    </queries>

    <application>
        ....
```

- 어플에서 인터넷을 통해 외부 API 를 사용하기 위해 권한을 부여한다.

그리고 여기서 android 를 안드로이드스튜디오로 열어서

```xml

<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <uses-permission android:name="android.permission.INTERNET"/>

    <queries>
        <package android:name="com.callor.movie" />
        <intent>
            <action android:name="android.intent.action.VIEW"/>
            <data android:scheme="https"/>

        </intent>
    </queries>

    <application>
            ...

```

이렇게 변경한다. **\*** 업그레이드 절대 금지 \*\*\*\*
