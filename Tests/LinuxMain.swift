import XCTest

import AESCryptableTests

var tests = [XCTestCaseEntry]()
tests += AESCryptableTests.allTests()
XCTMain(tests)
