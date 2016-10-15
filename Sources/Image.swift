//
//  Image.swift
//  MIMEResolver
//
//  Created by Jakub Petrík on 10/15/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

public struct Bmp: MIME {
    public let signature: [UInt8] = [0x42, 0x4d]
    public let contentType = "image/x-ms-bmp"
}
