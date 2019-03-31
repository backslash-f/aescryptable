# AESCryptable
Provides `Advanced Encryption Standard (AES)` encryption / decryption capabilities.

## Details
- [x] Relies on `CCCrypt` (`CommonCrypto`). CCCrypt man pages: http://bit.ly/cccryptManPages
- [x] Works (only) with 256 bit AES keys size. This is by design.
- [x] Uses `kCCOptionPKCS7Padding` as `CCOptions`.
- [x] Uses `Cipher Block Chaining (CBC)` mode with random `Initialization Vector (iv)` data.

Interesting reading: [Differences between DES and AES](http://bit.ly/desVSaes)

## Swift 5
In Swift 5, there are some changes around `withUnsafeBytes(_:)` (and a couple of bugs as a result).  
Refer to this forums.swift.org post: [*use of withunsafebytes*](http://bit.ly/withUnsafeBytes).

This AES implementation relies on `UnsafeRawPointer.assumingMemoryBound(to:)` to make
`withUnsafeBytes(_:)` to work (and silent warnings). This is probably going to change in the next Swift versions.

The [`extension Data`](https://github.com/backslash-f/aes-swift/blob/master/Sources/DataExtension.swift) aims to abstract some of the complexity around the subject.

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

## Usage
```swift
import AESCryptable

do {

// encrypt
let aes = try AES(keyString: "01234567890123456789012345678901")
let encryptedData = try aesEncrypt.encrypt("The black night always triumphs!")

// decrypt
let decryptedString = try aes.decrypt(encryptedData)
print(decryptedString) // The black night always triumphs!

} catch {
...
}
```

Refer to [the test class](https://github.com/backslash-f/aes-swift/blob/master/Tests/AESCryptableTests.swift) for a high-level overview.
