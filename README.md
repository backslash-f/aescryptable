[![swift-version](https://img.shields.io/badge/swift-5.1-brightgreen?logo=swift)](https://github.com/apple/swift)
[![swift-package-manager](https://img.shields.io/badge/package%20manager-compatible-brightgreen.svg?logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNjJweCIgaGVpZ2h0PSI0OXB4IiB2aWV3Qm94PSIwIDAgNjIgNDkiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8IS0tIEdlbmVyYXRvcjogU2tldGNoIDYzLjEgKDkyNDUyKSAtIGh0dHBzOi8vc2tldGNoLmNvbSAtLT4KICAgIDx0aXRsZT5Hcm91cDwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4KICAgIDxnIGlkPSJQYWdlLTEiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSJHcm91cCIgZmlsbC1ydWxlPSJub256ZXJvIj4KICAgICAgICAgICAgPHBvbHlnb24gaWQ9IlBhdGgiIGZpbGw9IiNEQkI1NTEiIHBvaW50cz0iNTEuMzEwMzQ0OCAwIDEwLjY4OTY1NTIgMCAwIDEzLjUxNzI0MTQgMCA0OSA2MiA0OSA2MiAxMy41MTcyNDE0Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDI1IDMxIDI1IDM1IDI1IDM3IDI1IDM3IDE0IDI1IDE0IDI1IDI1Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRUZDNzVFIiBwb2ludHM9IjEwLjY4OTY1NTIgMCAwIDE0IDYyIDE0IDUxLjMxMDM0NDggMCI+PC9wb2x5Z29uPgogICAgICAgICAgICA8cG9seWdvbiBpZD0iUmVjdGFuZ2xlIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDAgMzUgMCAzNyAxNCAyNSAxNCI+PC9wb2x5Z29uPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+)](https://github.com/apple/swift-package-manager)
[![build-status](https://github.com/backslash-f/aescryptable/workflows/build/badge.svg?branch=master)](https://github.com/backslash-f/aescryptable/actions)
[![license](https://img.shields.io/badge/license-mit-brightgreen.svg?logo=data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMi4wMDkgNTEyLjAwOSIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyLjAwOSA1MTIuMDA5OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4Ij4KPHBhdGggc3R5bGU9ImZpbGw6IzRDQUY1MDsiIGQ9Ik0yNTUuOTQ0LDE1LjkzQzExNC42MTgsMTUuOTAyLDAuMDI4LDEzMC40NDYsMCwyNzEuNzcyQy0wLjAxOCwzNjQuMDg5LDQ5LjY4OSw0NDkuMjYsMTMwLjA3Nyw0OTQuNjUgIGMyLjQ1NiwxLjQxNSw1LjM4LDEuNzc3LDguMTA3LDEuMDAzYzIuNzA4LTAuNzU2LDUuMDA4LTIuNTUsNi40LTQuOTkybDc4LjkzMy0xMzkuNDk5YzIuODk1LTUuMTI2LDEuMDkxLTExLjYyOC00LjAzMi0xNC41MjggIGMtMzUuOTU0LTIwLjE5NC00OC43My02NS43MTItMjguNTM1LTEwMS42NjZzNjUuNzEyLTQ4LjczLDEwMS42NjYtMjguNTM1czQ4LjczLDY1LjcxMiwyOC41MzUsMTAxLjY2NiAgYy02LjcxMiwxMS45NTEtMTYuNTg1LDIxLjgyMy0yOC41MzUsMjguNTM1Yy01LjEyMywyLjktNi45MjcsOS40MDItNC4wMzIsMTQuNTI4bDc4LjcyLDEzOS40OTljMS4zODgsMi40NSwzLjY4OSw0LjI1Myw2LjQsNS4wMTMgIGMwLjkyOSwwLjI2OSwxLjg5MSwwLjQwNiwyLjg1OSwwLjQwNWMxLjg0LTAuMDAyLDMuNjQ4LTAuNDgsNS4yNDgtMS4zODdjMTIzLjA4Ny02OS40NDQsMTY2LjU3My0yMjUuNTIyLDk3LjEyOS0zNDguNjEgIEM0MzMuNTQ4LDY1LjYyOSwzNDguMzE5LDE1Ljg4NCwyNTUuOTQ0LDE1LjkzeiIvPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K)](https://en.wikipedia.org/wiki/MIT_License)

# AESCryptable
Provides [`Advanced Encryption Standard (AES)`](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard) capabilities.

- [x] Relies on native [`CCCrypt`](http://bit.ly/cccryptManPages) (via `import CommonCrypto`).
- [x] Uses [`Cipher Block Chaining (CBC)`](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Cipher_Block_Chaining_(CBC)) mode with random [`Initialization Vector (IV)`](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Initialization_vector_(IV)).
- [x] Works (only) with **256-bit** [`key size`](https://en.wikipedia.org/wiki/Key_size). This is by design.
- [x] Uses `kCCOptionPKCS7Padding` as `CCOptions` by default.

## Integration
### Xcode 11+
![AESCryptable Xcode 11 SPM](https://i.imgur.com/JKciz5T.gif)

(More on the topic from WWDC 2019: [Adopting Swift Packages in Xcode](https://developer.apple.com/videos/play/wwdc2019/408/) and [Creating Swift Packages](https://developer.apple.com/videos/play/wwdc2019/410/).)

### Via Package.swift
In your `Package.swift`, add `AESCryptable` as a dependency:
```swift
dependencies: [
  // 🔐 AES encryption/decryption with random iv. Swift 5 and up.
  .package(url: "https://github.com/backslash-f/aescryptable", from: "1.0.0")
],
```

Associate the dependency with your target:
```swift
targets: [
  .target(name: "App", dependencies: ["AESCryptable"])
]
```
Run: `swift build`

## Usage
```swift
import AESCryptable

do {
  // encrypt
  let aes = try AES(keyString: "01234567890123456789012345678901")
  let encryptedData = try aes.encrypt("The black knight always triumphs!")

  // decrypt
  let decryptedString = try aes.decrypt(encryptedData)
  print(decryptedString) // The black knight always triumphs!

} catch {
  print(error)
}
```

(Refer to [the test class](https://github.com/backslash-f/aescryptable/blob/master/Tests/AESCryptableTests/AESCryptableTests.swift) for a high-level overview.)

## Demo
Clone the repo and use `AESCryptable.playground` to see the code in action:

![AESCryptable Demo](https://i.imgur.com/6cI5Knu.gif)
