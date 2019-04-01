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
        guard let dataToEncrypt: Data = string.data(using: .utf8) else {
            throw AESError.stringToDataFailed
        }

        // Seems like the easiest way to avoid the `withUnsafeBytes` mess is to use NSData.bytes.
        let dataToEncryptNSData = NSData(data: dataToEncrypt)

        let bufferSize: Int = dataToEncryptNSData.length + kCCBlockSizeAES128
        let buffer = UnsafeMutablePointer<NSData>.allocate(capacity: bufferSize)
        defer { buffer.deallocate() }

        var numberBytesWritten: Int = 0

        let cryptStatus: CCCryptorStatus = CCCrypt( // Stateless, one-shot encrypt operation
            CCOperation(kCCEncrypt),                // op: CCOperation
            algorithm,                              // alg: CCAlgorithm
            options,                                // options: CCOptions
            key.bytes,                              // key: the "password"
            kCCBlockSizeAES128,                     // keyLength: the "password" size
            nil,                                    // iv: Initialization Vector
            dataToEncryptNSData.bytes,              // dataIn: Data to encrypt bytes
            dataToEncryptNSData.length,             // dataInLength: Data to encrypt size
            buffer,                                 // dataOut: encrypted Data buffer
            bufferSize,                             // dataOutAvailable: encrypted Data buffer size
            &numberBytesWritten                     // dataOutMoved: the number of bytes written
        )

        guard cryptStatus == CCCryptorStatus(kCCSuccess) else {
            throw AESError.encryptDataFailed
        }

        return Data(bytes: buffer, count: numberBytesWritten)
    }

    // MARK: - Decrypt

    public func decrypt(_ data: Data) throws -> String {
        // Seems like the easiest way to avoid the `withUnsafeBytes` mess is to use NSData.bytes.
        let dataToDecryptNSData = NSData(data: data)

        let bufferSize: Int = dataToDecryptNSData.count + kCCBlockSizeAES128
        let buffer = UnsafeMutablePointer<NSData>.allocate(capacity: bufferSize)
        defer { buffer.deallocate() }

        var numberBytesWritten: Int = 0

        let cryptStatus: CCCryptorStatus = CCCrypt( // Stateless, one-shot encrypt operation
            CCOperation(kCCDecrypt),                // op: CCOperation
            algorithm,                              // alg: CCAlgorithm
            options,                                // options: CCOptions
            key.bytes,                              // key: the "password"
            kCCBlockSizeAES128,                     // keyLength: the "password" size
            nil,                                    // iv: Initialization Vector
            dataToDecryptNSData.bytes,              // dataIn: Data to encrypt bytes
            dataToDecryptNSData.count,              // dataInLength: Data to encrypt size
            buffer,                                 // dataOut: encrypted Data buffer
            bufferSize,                             // dataOutAvailable: encrypted Data buffer size
            &numberBytesWritten                     // dataOutMoved: the number of bytes written
        )

        guard cryptStatus == CCCryptorStatus(kCCSuccess) else {
            throw AESError.decryptDataFailed
        }

        let decryptedData = Data(bytes: buffer, count: numberBytesWritten)
        guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
            throw AESError.dataToStringFailed
        }

        return decryptedString
    }
}
