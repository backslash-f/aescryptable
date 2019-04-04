import XCTest
@testable import AESCryptable

final class AESTests: XCTestCase {

    func testAESInitInvalidKeyFail() {
        do {
            let _ = try AES(keyString: "banana")
        } catch {
            guard let aesError = error as? AES.Error else {
                XCTFail("Unexpected error: \(error)")
                return
            }
            XCTAssertEqual(aesError, .invalidKeySize)
        }
    }

    func testAESInitValidKey() {
        do {
            let _ = try AES(keyString: "js@(Zmy&bf)u#kcMR?'#-6@r9JvC3#$J")
        } catch {
            XCTFail("Unexpected error: \(error)")
            return
        }
    }

    func testEncryptionEmptyStringFail() {
        let stringToEncrypt = ""
        do {
            let aes = try AES(keyString: "C_5};5fHV(v3M&h{m]6h_p[z[4h@ZWM$")
            let _ = try aes.encrypt(stringToEncrypt)
        } catch {
            guard let aesError = error as? AES.Error else {
                XCTFail("Unexpected error: \(error)")
                return
            }
            XCTAssertEqual(aesError, .emptyStringToEncrypt)
        }
    }

    func testEncryptionAndDecryption() {
        let stringToEncrypt = "The black night always triumphs!"
        let key = "Nmts*z2?eD5g6}qaME8pE.x9EK$2Ev#]"

        do {
            // Encrypt.
            let aesEncrypt = try AES(keyString: key)
            let encryptedData = try aesEncrypt.encrypt(stringToEncrypt)
            XCTAssertNotNil(encryptedData)

            // Decrypt.
            let aesDecrypt = try AES(keyString: key)
            let decryptedString = try aesDecrypt.decrypt(encryptedData)
            XCTAssertEqual(decryptedString, stringToEncrypt)

        } catch {
            XCTFail("Unexpected error: \(error)")
            return
        }
    }

    func testEncryptionAndDecryptionWithDifferentKeysFail() {
        let correctKey = "e6t!!y>C5q6p2t=Ae/m@hFjPhqEur_Gu"
        let incorrectKey = "CjbW}TaAsyPXd-J2fp)4WJ5>PJh_kG.#"
        let stringToEncrypt = "Listen, strange women lyin' in ponds distributin' swords is no basis for a system of government."

        do {
            // Encrypt.
            let aesCorrectKey = try AES(keyString: correctKey)
            let encryptedData = try aesCorrectKey.encrypt(stringToEncrypt)
            XCTAssertNotNil(encryptedData)

            // Decrypt.
            let aesIncorrectKey = try AES(keyString: incorrectKey)
            let _ = try aesIncorrectKey.decrypt(encryptedData)

        } catch {
            guard let aesError = error as? AES.Error else {
                XCTFail("Unexpected error: \(error)")
                return
            }
            XCTAssertEqual(aesError, .dataToStringFailed)
        }
    }

    static var allTests = [
        ("testAESInitInvalidKeyFail", testAESInitInvalidKeyFail),
        ("testAESInitValidKey", testAESInitValidKey),
        ("testEncryptionEmptyStringFail", testEncryptionEmptyStringFail),
        ("testEncryptionAndDecryption", testEncryptionAndDecryption),
        ("testEncryptionAndDecryptionWithDifferentKeysFail", testEncryptionAndDecryptionWithDifferentKeysFail)
    ]
}
