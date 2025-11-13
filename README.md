# flutter_mvvm_template

### 开发环境（默认）
flutter run

### 或显式指定开发环境
flutter run --dart-define=ENVIRONMENT=dev

### 生产环境
flutter run --dart-define=ENVIRONMENT=prod

### 自定义 API 地址
flutter run \
  --dart-define=ENVIRONMENT=dev \
  --dart-define=BASE_URL=https://dev-api.example.com

### 打包生产版本
flutter build apk \
  --dart-define=ENVIRONMENT=prod \
  --dart-define=BASE_URL=https://api.example.com \
  --release

flutter build ios \
  --dart-define=ENVIRONMENT=prod \
  --release
