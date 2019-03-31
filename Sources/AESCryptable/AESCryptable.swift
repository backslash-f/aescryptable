//
//  AESCryptable.swift
//  AESCryptable
//
//  Created by Fernando Fernandes on 30.03.19.
//  Copyright © 2019 backslash-f. All rights reserved.
//

import Foundation
import CommonCrypto

// MARK: - Cryptable Protocol

extension AES: Cryptable {

    // MARK: - Encrypt

    public func encrypt(_ string: String) throws -> Data {
        guard !string.isEmpty else {
            throw AESError.emptyStringToEncrypt
        }

        guard let dataToEncrypt: Data = string.data(using: .utf8) else {
            throw AESError.stringToDataFailed
        }

        guard let dataToEncryptBytes: UnsafePointer<Int> = dataToEncrypt.bytesBoundToInt() else {
            throw AESError.bindBytesToIntFailed
        }

        guard keyBytes != nil else {
            throw AESError.bindBytesToIntFailed
        }

        let encryptedDataLength: Int = dataToEncrypt.count + (ivSize + kCCBlockSizeAES128)
        var encryptedData: Data = Data(count: encryptedDataLength)
        guard let encryptedDataBytes: UnsafeMutablePointer<Int> = encryptedData.mutableBytesBoundToInt() else {
            throw AESError.bindMutableBytesToIntFailed
        }
        try generateRandomIV(for: encryptedDataBytes)

        var  numberOfBytesEncrypted: Int = 0

        let cryptStatus: Int32 = CCCrypt(               // Stateless, one-shot encrypt operation
            CCOperation(kCCEncrypt),                    // op: CCOperation
            CCAlgorithm(kCCAlgorithmAES),               // alg: CCAlgorithm
            options,                                    // options: CCOptions
            keyBytes,                                   // key: the "password" as "bytes bound to Int"
            keyLength,                                  // keyLength: the "password" size as Int
            encryptedDataBytes,                         // iv: encrypted Data as "mutable bytes bound to Int"
            dataToEncryptBytes,                         // dataIn: Data to encrypt as "bytes bound to Int"
            dataToEncrypt.count,                        // dataInLength: the size of Data to encrypt as Int
            encryptedDataBytes + kCCBlockSizeAES128,    // dataOut: encrypted Data as "mutable bytes bound to Int"
            encryptedDataLength,                        // dataOutAvailable: the size of encrypted Data as Int
            &numberOfBytesEncrypted                     // dataOutMoved: the number of bytes written
        )

        guard cryptStatus == CCCryptorStatus(kCCSuccess) else {
            throw AESError.encryptDataFailed
        }

        encryptedData.count = numberOfBytesEncrypted + ivSize
        return encryptedData
    }

    // MARK: - Decrypt

    public func decrypt(_ data: Data) throws -> String {
        guard let dataToDecryptBytes: UnsafePointer<Int> = data.bytesBoundToInt() else {
            throw AESError.bindBytesToIntFailed
        }

        let decryptedDataLength: Int = data.count - ivSize
        var decryptedData: Data = Data(count: decryptedDataLength)
        guard let decryptedDataBytes: UnsafeMutablePointer<Int> = decryptedData.mutableBytesBoundToInt() else {
            throw AESError.bindMutableBytesToIntFailed
        }

        guard keyBytes != nil else {
            throw AESError.bindBytesToIntFailed
        }

        var numberOfBytesDecrypted: Int = 0

        let cryptStatus: Int32 = CCCrypt(               // Stateless, one-shot decrypt operation
            CCOperation(kCCDecrypt),                    // op: CCOperation
            CCAlgorithm(kCCAlgorithmAES128),            // alg: CCAlgorithm
            options,                                    // options: CCOptions
            keyBytes,                                   // key: the "password" as "bytes bound to Int"
            keyLength,                                  // keyLength: the "password" size as Int
            dataToDecryptBytes,                         // iv: Data to decrypt as "bytes bound to Int"
            dataToDecryptBytes + kCCBlockSizeAES128,    // dataIn: Data to decrypt as "bytes bound to Int"
            decryptedDataLength,                        // dataInLength: the size of decrypted Data as Int
            decryptedDataBytes,                         // dataOut: decrypted Data as "mutable bytes bound to Int"
            decryptedDataLength,                        // dataOutAvailable: the size of decrypted Data as Int
            &numberOfBytesDecrypted                     // dataOutMoved: the number of bytes written
        )

        guard cryptStatus == CCCryptorStatus(kCCSuccess) else {
            throw AESError.decryptDataFailed
        }

        decryptedData.count = numberOfBytesDecrypted

        guard let decryptedString = String(bytes: decryptedData, encoding: .utf8) else {
            throw AESError.dataToStringFailed
        }

        return decryptedString
    }
}
