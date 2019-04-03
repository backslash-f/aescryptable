//
//  AES.swift
//  AESCryptable
//
//  Created by Fernando Fernandes on 30.03.19.
//  Copyright © 2019 backslash-f. All rights reserved.
//

import Foundation
import CommonCrypto

/// Provides `Advanced Encryption Standard (AES)` encryption / decryption capabilities.
///
/// Things to notice:
/// - Relies on `CCCrypt` (`CommonCrypto`). CCCrypt man pages: http://bit.ly/cccryptManPages
/// - Works (only) with 256 bit AES keys size. This is by design
/// - Uses `kCCOptionPKCS7Padding` as `CCOptions`
/// - Uses `Cipher Block Chaining (CBC)` mode with random `Initialization Vector (iv)` data
///
/// Interesting reading: [Differences between DES and AES](http://bit.ly/desVSaes)
public struct AES {
    
    // MARK: - Internal Properties

    // MARK: Key Related
    
    public let key: Data

    // MARK: CCCrypt Related

    internal let ivSize: Int            = kCCBlockSizeAES128
    internal let options: UInt32        = CCOptions(kCCOptionPKCS7Padding)

    // MARK: - Lifecycle

    /// Initializes the `AES struct` with the given key, which must match the `kCCKeySizeAES256` size
    /// (256 bit AES key size).
    ///
    /// There is an interesting discussion on the 128 vs 256 topic [here](http://bit.ly/128vs256).
    ///
    /// - Parameter keyString: 256 bit AES key size.
    /// - Throws: `AESError`
    public init(keyString: String) throws {
        
        guard keyString.count == kCCKeySizeAES256 else {
            throw AESError.invalidKeySize
        }
        guard let keyData: Data = keyString.data(using: .utf8) else {
            throw AESError.stringToDataFailed
        }
        
        self.key = keyData
    }
}
