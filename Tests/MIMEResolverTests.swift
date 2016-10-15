//
//  MIMEResolverTests.swift
//  MIMEResolverTests
//
//  Created by Jakub Petrík on 10/14/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

import XCTest
@testable import MIMEResolver

class MockMIME: MIME {
    var signature: [UInt8]
    var contentType: String

    init(signature: [UInt8] = [0x49, 0x4e, 0x4c, 0x4f, 0x4f, 0x50],
         contentType: String = "test/mock") {
        self.signature = signature
        self.contentType = contentType
    }
}

class MIMEResolverTests: XCTestCase {

    func testResolverInitializedEmpty() {
        let resolver = MIMEResolver()
        XCTAssertEqual(resolver.registeredTypes.count, 0)
    }

    func testRegister() {
        let mock = MockMIME()
        let resolver = MIMEResolver()
        resolver.register(mimeType: mock)
        XCTAssertEqual(resolver.registeredTypes.count, 1)
    }

    func testResolveNotNil() {
        let mock = MockMIME()
        let data = Data(bytes: mock.signature)
        let resolver = MIMEResolver()
        resolver.register(mimeType: mock)
        let resolved = resolver.resolve(data: data)
        XCTAssertNotNil(resolved)
    }

    func testResolveResolvesCorrectMIMEType() {
        let mock = MockMIME()
        let data = Data(bytes: mock.signature)
        let resolver = MIMEResolver()
        resolver.register(mimeType: mock)
        let resolved = resolver.resolve(data: data)!
        
        XCTAssertEqual(resolved.contentType, mock.contentType)
        XCTAssertEqual(resolved.signature, mock.signature)
    }
}
