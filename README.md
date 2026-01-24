# qjay

A new Flutter project.

-- Proto
    sudo dnf install protobuf-compiler protobuf-devel
    dart pub global activate protoc_plugin

    protoc -Ilib/transport/proto -I/usr/include --dart_out=lib/transport/proto lib/transport/proto/*.proto /usr/include/google/protobuf/empty.proto /usr/include/google/protobuf/timestamp.proto

-- SSH
    - security unlock-keychain -p "pass" ~/Library/Keychains/login.keychain-db
    - security show-keychain-info ~/Library/Keychains/login.keychain-db

    - brew install ios-deploy
    - flutter build ios --release
    - ios-deploy --bundle build/ios/iphoneos/Runner.app   