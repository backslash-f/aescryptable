[![swift-5.0](https://img.shields.io/badge/swift-5.0-brightgreen.svg)](https://github.com/apple/swift)
[![package%20manager-compatible](https://img.shields.io/badge/package%20manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![build status](https://travis-ci.com/backslash-f/aescryptable.svg?branch=master)](https://travis-ci.com/backslash-f/aescryptable)

# AESCryptable
Provides `Advanced Encryption Standard (AES)` encryption / decryption capabilities.

## Details
- [x] Relies on `CCCrypt` (`CommonCrypto`). CCCrypt man pages: http://bit.ly/cccryptManPages
- [x] Works (only) with 256 bit AES keys size. This is by design.
- [x] Uses `kCCOptionPKCS7Padding` as `CCOptions`.
- [x] Uses `Cipher Block Chaining (CBC)` mode with random `Initialization Vector (iv)` data.

Interesting reading: [Differences between DES and AES](http://bit.ly/desVSaes)

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

Refer to [the test class](https://github.com/backslash-f/aes-swift/blob/master/Tests/AESCryptableTests.swift) for a high-level overview.
