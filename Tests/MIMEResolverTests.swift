//
//  MIMEResolverTests.swift
//  MIMEResolverTests
//
//  Created by Jakub Petrík on 10/14/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

import XCTest
@testable import MIMEResolver

struct MockMIME: MIME {
    let signature: [UInt8] = [0x49, 0x4e, 0x4c, 0x4f, 0x4f, 0x50]
    let contentType: String = "test/mock"
}

class MIMEResolverTests: XCTestCase {
    
}
