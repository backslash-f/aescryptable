//
//  DataExtension.swift
//  AESCryptable
//
//  Created by Fernando Fernandes on 30.03.19.
//  Copyright © 2018 backslash-f. All rights reserved.
//

import Foundation

/// In Swift 5, there are some changes around `withUnsafeBytes(_:)` (and a couple of bugs as a result).
/// For instance, refer to: (forums.swift.org) [use of withunsafebytes](http://bit.ly/withUnsafeBytes).
///
/// This `strutc AES` implementation relies on `UnsafeRawPointer.assumingMemoryBound(to:)` to make
/// `withUnsafeBytes(_:)` to work. This is probably going to change in the next Swift versions.
///
/// The following `Data extension` aims to abstract some of the complexity around the subject.
extension Data {

    func bytesBoundToInt() -> UnsafePointer<Int>? {
        return withUnsafeBytes { dataBytes in
            dataBytes.baseAddress?.assumingMemoryBound(to: Int.self)
        }
    }

    mutating func mutableBytesBoundToInt() -> UnsafeMutablePointer<Int>? {
        return withUnsafeMutableBytes { mutableDataBytes in
            mutableDataBytes.baseAddress?.assumingMemoryBound(to: Int.self)
        }
    }
}

