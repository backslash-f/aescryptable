[![swift-5.0](https://img.shields.io/badge/swift-5.0-brightgreen.svg)](https://github.com/apple/swift)
[![package%20manager-compatible](https://img.shields.io/badge/package%20manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![build status](https://travis-ci.com/backslash-f/aescryptable.svg?branch=master)](https://travis-ci.com/backslash-f/aescryptable)

# AESCryptable
Provides `Advanced Encryption Standard (AES)` encryption / decryption capabilities.

- [x] Relies on native [`CCCrypt`](http://bit.ly/cccryptManPages) (via `import CommonCrypto`).
- [x] Uses `Cipher Block Chaining (CBC)` mode with random `Initialization Vector (iv)` data.
- [x] Works (only) with AES `256-bit key`. This is by design.
- [x] Uses `kCCOptionPKCS7Padding` as `CCOptions` by default.

## Integration
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

(or `vapor update -y`)

## Example
```swift
import AESCryptable

do {
  // encrypt
  let aes = try AES(keyString: "01234567890123456789012345678901")
  let encryptedData = try aes.encrypt("The black night always triumphs!")

  // decrypt
  let decryptedString = try aes.decrypt(encryptedData)
  print(decryptedString) // The black night always triumphs!

} catch {
  print(error)
}
```

Refer to [the test class](https://github.com/backslash-f/aescryptable/blob/master/Tests/AESCryptableTests/AESCryptableTests.swift) for a high-level overview.
