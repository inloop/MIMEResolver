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
    
    func resolveImage(extension ext: String, type: MIME.Type) -> MIME.Type? {
        let resolver = MIMEResolver()
        resolver.register(mimeType: type)
        let assetURL = Bundle(for: ImageTests.self).url(forResource: "test", withExtension: ext)!
        let data = try! Data(contentsOf: assetURL)
        return resolver.resolve(data: data)
    }

    func testBmp() {
        let resolved = resolveImage(extension: "bmp", type: Bmp.self)
        XCTAssert(resolved is Bmp.Type)
    }

    func testGif() {
        let resolved = resolveImage(extension: "gif", type: Gif.self)
        XCTAssert(resolved is Gif.Type)
    }

    func testJpeg() {
        let resolved = resolveImage(extension: "jpg", type: Jpeg.self)
        XCTAssert(resolved is Jpeg.Type)
    }

    func testPng() {
        let resolved = resolveImage(extension: "png", type: Png.self)
        XCTAssert(resolved is Png.Type)
    }
}
