//
//  AESError.swift
//  AESCryptable
//
//  Created by Fernando Fernandes on 30.03.19.
//  Copyright © 2019 backslash-f. All rights reserved.
//

/// Encapsulates errors that may occur during AES encrypt / decrypt operations.
///
/// - bindBytesToIntFailed: `UnsafeRawPointer.assumingMemoryBound(to:)` using `Int.self` failed.
/// - bindMutableBytesToIntFailed: `UnsafeMutableRawPointer.assumingMemoryBound(to:)` using `Int.self` failed.
/// - dataToStringFailed: Failed to convert `Data` into `String`. E.g.: via `String.init(bytes:encoding:)`.
/// - decryptDataFailed: `CCCryptorStatus` was different than `kCCSuccess` during a decryption operation.
/// - emptyStringToEncrypt: The given `String` to encrypt is empty.
/// - encryptDataFailed: `CCCryptorStatus` was different than `kCCSuccess` during an encryption operation.
/// - generateRandomIVFailed: Could not generate a random `iv` via `SecRandomCopyBytes(_:_:_:)`.
/// - invalidKeySize: The given key `String` count isn't equal to `kCCKeySizeAES256`.
/// - stringToDataFailed: Failed to convert `String` into `Data` via `data(using:allowLossyConversion:)`.
public enum AESError: Error {
    case bindBytesToIntFailed
    case bindMutableBytesToIntFailed
    case dataToStringFailed
    case decryptDataFailed
    case emptyStringToEncrypt
    case encryptDataFailed
    case generateRandomIVFailed
    case invalidKeySize
    case stringToDataFailed
}
