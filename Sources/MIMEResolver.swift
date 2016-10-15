//
//  MIMEResolver.swift
//  MIMEResolver
//
//  Created by Jakub Petrík on 10/15/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

public final class MIMEResolver {
    internal private(set) var registeredTypes = [String: MIME]()
    internal private(set) var maxSignatureBytesCount = 0

    public static let `default` = MIMEResolver()

    public func register(mimeType: MIME) {
        registeredTypes[mimeType.contentType] = mimeType
    }

    public func unregister(mimeType: MIME) {
        registeredTypes.removeValue(forKey: mimeType.contentType)
    }
    
    public func resolve(data: Data) -> MIME? {
        maxSignatureBytesCount = registeredTypes.values.reduce(0) {
            max($0, $1.signature.count)
        }

        var bytes = [UInt8](repeating: 0, count: maxSignatureBytesCount)
        data.copyBytes(to: &bytes, count: maxSignatureBytesCount)

        var mime: MIME?
        for mimeType in registeredTypes.values {
            if mimeType.signature == bytes {
                mime = mimeType
                break
            }
        }

        return mime
    }
}
