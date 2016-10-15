//
//  MIME.swift
//  MIMEResolver
//
//  Created by Jakub Petrík on 10/15/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

public protocol MIME {
    static var signature: [UInt8] { get }
    static var contentType: String { get }
}
