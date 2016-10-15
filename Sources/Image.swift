//
//  Image.swift
//  MIMEResolver
//
//  Created by Jakub Petrík on 10/15/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

public enum Bmp: MIME {
    public static let signature: [UInt8] = [0x42, 0x4d]
    public static let contentType = "image/x-ms-bmp"
}

public enum Gif: MIME {
    public static let signature: [UInt8] = [0x47, 0x49, 0x46]
    public static let contentType = "image/gif"
}

public enum Jpeg: MIME {
    public static let signature: [UInt8] = [0xff, 0xd8, 0xff]
    public static let contentType = "image/jpeg"
}

public enum Png: MIME {
    public static let signature: [UInt8] = [0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]
    public static let contentType = "image/png"
}
