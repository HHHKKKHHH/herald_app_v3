# herald_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Troubleshooting

0x01 
```
/.../herald_app/build/ios/Debug-iphonesimulator/Runner.app: resource fork, Finder information, or similar detritus not allowed
    Command CodeSign failed with a nonzero exit code
    note: Using new build systemnote: Planning buildnote: Constructing build description
Could not build the application for the simulator.
```

使用

```
xattr -cr /.../herald_app/build/ios/Debug-iphonesimulator/Runner.app
```
