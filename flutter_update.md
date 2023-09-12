## flutter update

- flutter, dart 도구가 업데이트 되는 경우가 자주 발생한다
- 현재 사용중인 프로젝트의 flutter, dart 를 업데이트 하면. 기존의 프로젝트가 작동이 안되는 경우도 있다. 그러니 신중하게 업데이트를 실행해야 함

- 기존의 dependencies 를 최신 버전으로 업데이트 한다. :

```bash
flutter pub upgrade outdated
```

- 프로젝트 clean 과 재설정

```bash
flutter clean
flutter pub get
```

- 그리고 flutter 도구 자체를 업데이트 하는 방법도 있다.

```bash
flutter upgrade
```

- 그런데 업데이트 과정에서 문제가 발생해 업데이트가 안되는 경우가 있다. 그럴떄는

```bash
flutter pub upgrade --major-versions
```

```bash - 프로젝트 폴더에서 하는게 아니라 상위폴더에서 실행
- flutter upgrade --force
```
