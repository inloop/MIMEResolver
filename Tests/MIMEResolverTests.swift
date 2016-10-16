//
//  MIMEResolverTests.swift
//  MIMEResolverTests
//
//  Created by Jakub Petrík on 10/14/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

import XCTest
@testable import MIMEResolver

enum Inloop: MIME {
    static let signature: [UInt8] = [0x49, 0x4e, 0x4c, 0x4f, 0x4f, 0x50]
    static let contentType = "test/inloop"
    static let validExtensions: [String] = []
}

enum LoopLoop: MIME {
    static let signature: [UInt8] = [0x4c, 0x4f, 0x4f, 0x50, 0x4c, 0x4f, 0x4f, 0x50]
    static let contentType = "test/loop"
    static let validExtensions: [String] = []
}


class MIMEResolverTests: XCTestCase {

    func testResolverInitializedEmpty() {
        let resolver = MIMEResolver()
        XCTAssertEqual(resolver.registeredTypes.count, 0)
    }

    func testRegister() {
        let resolver = MIMEResolver()
        resolver.register(mimeType: Inloop.self)
        XCTAssertEqual(resolver.registeredTypes.count, 1)
    }

    func testRegisterOnlyOnce() {
        let resolver = MIMEResolver()
        resolver.register(mimeType: Inloop.self)
        resolver.register(mimeType: Inloop.self)
        XCTAssertEqual(resolver.registeredTypes.count, 1)
    }

    func testUnregister() {
        let resolver = MIMEResolver()
        resolver.register(mimeType: Inloop.self)
        resolver.unregister(mimeType: Inloop.self)
        XCTAssertEqual(resolver.registeredTypes.count, 0)
    }

    func testMaxSignatureLength() {
        let resolver = MIMEResolver()
        XCTAssertEqual(resolver.maxSignatureBytesCount, 0)
        resolver.register(mimeType: Inloop.self)
        XCTAssertEqual(resolver.maxSignatureBytesCount, Inloop.signature.count)
        resolver.register(mimeType: LoopLoop.self)
        XCTAssertEqual(resolver.maxSignatureBytesCount, LoopLoop.signature.count)
        resolver.unregister(mimeType: LoopLoop.self)
        XCTAssertEqual(resolver.maxSignatureBytesCount, Inloop.signature.count)
    }

    func testResolveNotNil() {
        let data = Data(bytes: Inloop.signature)
        let resolver = MIMEResolver()
        resolver.register(mimeType: Inloop.self)
        let resolved = resolver.resolve(data)
        XCTAssertNotNil(resolved)
    }

    func testResolveResolvesCorrectMIMEType() {
        let data = Data(bytes: Inloop.signature)
        let resolver = MIMEResolver()
        resolver.register(mimeType: Inloop.self)
        let resolved = resolver.resolve(data)!
        XCTAssertEqual(resolved.contentType, Inloop.contentType)
        XCTAssertEqual(resolved.signature, Inloop.signature)
    }

    func testResolveReturnsNil() {
        let data = Data(bytes: Inloop.signature.dropFirst())
        let resolver = MIMEResolver()
        resolver.register(mimeType: Inloop.self)
        let resolved = resolver.resolve(data)
        XCTAssertNil(resolved)
    }
}
