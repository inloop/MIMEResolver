//
//  ImageTests.swift
//  MIMEResolver
//
//  Created by Jakub Petrík on 10/15/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

import XCTest
@testable import MIMEResolver

class ImageTests: XCTestCase {
    
    func resolveImage(type: MIME.Type) {
        let resolver = MIMEResolver()
        resolver.register(mimeType: type)
        let bundle = Bundle(for: ImageTests.self)
        let assetURL = type.validExtensions.flatMap { bundle.url(forResource: "test", withExtension: $0) }.first!
        let data = try! Data(contentsOf: assetURL)
        let resolved = resolver.resolve(data)
        XCTAssert(resolved == type)
    }

    func testBmp() {
        resolveImage(type: Bmp.self)
    }

    func testGif() {
        resolveImage(type: Gif.self)
    }

    func testJpeg() {
        resolveImage(type: Jpeg.self)
    }

    func testPng() {
        resolveImage(type: Png.self)
    }

    func testIff() {
        resolveImage(type: Iff.self)
    }
}
