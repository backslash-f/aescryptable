//
//  AESError.swift
//  AESCryptable
//
//  Created by Fernando Fernandes on 30.03.19.
//  Copyright © 2019 backslash-f. All rights reserved.
//

/// Encapsulates errors that may occur during AES encrypt / decrypt operations.
///
/// - invalidKeySize: The given key `String` count isn't equal to `kCCKeySizeAES256`.
/// - emptyStringToEncrypt: The given `String` to encrypt is empty.
/// - generateRandomIVFailed: Could not generate a random `iv` via `SecRandomCopyBytes(_:_:_:)`.
/// - encryptDataFailed: `CCCryptorStatus` was different than `kCCSuccess` during an encryption operation.
/// - stringToDataFailed: Failed to convert `String` into `Data` via `data(using:allowLossyConversion:)`.
/// - decryptDataFailed: `CCCryptorStatus` was different than `kCCSuccess` during a decryption operation.
/// - dataToStringFailed: Failed to convert `Data` into `String`. E.g.: via `String.init(bytes:encoding:)`.
public enum AESError: Error {
    case invalidKeySize
    case emptyStringToEncrypt
    case generateRandomIVFailed
    case encryptDataFailed
    case stringToDataFailed
    case decryptDataFailed
    case dataToStringFailed
}
