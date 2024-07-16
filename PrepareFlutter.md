## Flutter Project Preparation

1. To initialize Flutter project (only once), use this command:
    ```bash
    flutter create <your-program>
    ```
    For creating a project at current directory, use this command:
    ```bash
    flutter create .
    ```
2. To install Flutter libraries, 
    add packages to `pubspec.yaml` file under `dependencies` or `dev_dependencies`
    and use this command:
    ```bash
    flutter pub get
    ```
3. To update Flutter libraries, use this command:
    ```bash
    flutter pub upgrade
    ```
4. To add assets to Flutter project, update `pubspec.yaml` file:
    ```yaml
    flutter:
        assets:
            - <your-directory>/<your-asset>
            - images/my-icon.png
            - assets/mydb.db
    ```
5. To change compiler options in `analysis_options.yaml`, update these fields:
    ```yaml
    analyzer:
        errors:
            dangling_library_doc_comments: ignore
            slash_for_doc_comments: ignore
    ```
6. To change application content size,
    For MacOS, update `macos/Runner/Base.lproj/MainMenu.xib` file:
    ```xml
    <rect key="contentRect" x="335" y="390" width="<app-width>" height="<app-height>"/>
    <rect key="screenRect" x="0.0" y="0.0" width="2560" height="1577"/>
    <view key="contentView" wantsLayer="YES" id="EiT-Mj-1SZ">
        <rect key="frame" x="0.0" y="0.0" width="<app-width>" height="<app-height>"/>
        <autoresizingMask key="autoresizingMask"/>
    </view>
    ```
    For Windows, update `windows/runner/main.cpp` file:
    ```cpp
    Win32Window::Point origin(<app-left>, <app-top>);
    Win32Window::Size size(<app-width>, <app-height>);
    ```
7. To run Flutter project, use this command:
    ```bash
    flutter run
    ```
    To run on Chrome with HTTP request, use this command:
    ```bash
    flutter run -d chrome --web-browser-flag "--disable-web-security"
    ```
8. To build Flutter project, use this command:
    ```bash
    flutter build [<your-platform>]
    ```
