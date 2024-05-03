# base

## Change package
`fluttergen -c pubspec.yaml`

## Gen asset
`fluttergen -c pubspec.yaml`

## Gen l10n
`flutter gen-l10n`

## Gen model & env
`dart run build_runner build --delete-conflicting-outputs`


Thứ mục feature chứa danh sách các tính năng của ứng dụng
Các tính năng chủ yếu chia thành 3 phần
    - data
        - api: Khai báo api sử dụng
        - models: khai báo các model, entity
        - repository: khai báo repository
    - di: khai báo dependencies
    - ui
        - component: khai báo widgets
        - page: khai báo các màn hình view
        - provider: khai báo providers, sử dụng Riverpod