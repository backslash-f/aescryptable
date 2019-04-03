//
//  AESExtension.swift
//  AESCryptable
//
//  Created by Fernando Fernandes on 30.03.19.
//  Copyright © 2019 backslash-f. All rights reserved.
//

import Foundation
import CommonCrypto

// MARK: - Internal Extension

internal extension AES {
    
    /// Generates an `Initialization Vector` with random data for the `Cipher Block Chaining (CBC)` mode with
    /// block size `kCCBlockSizeAES128`.
    ///
    /// - Parameter data: The `Data` in which the generated `iv` will be attached into.
    /// - Throws: `AESError`
    func generateRandomIV(for data: inout Data) throws {
        
        try data.withUnsafeMutableBytes { dataBytes in
            
            guard let dataBytesBaseAddress = dataBytes.baseAddress else {
                throw AESError.generateRandomIVFailed
            }
            
            let status: Int32 = SecRandomCopyBytes(
                kSecRandomDefault,
                kCCBlockSizeAES128,
                dataBytesBaseAddress
            )
            
            guard status == 0 else {
                throw AESError.generateRandomIVFailed
            }
        }
    }
}
