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

    private func updateMaxSignatureBytesCount() {
        maxSignatureBytesCount = registeredTypes.values.reduce(0) {
            max($0, $1.signature.count)
        }
    }

    public static let `default`: MIMEResolver = {
        let instance = MIMEResolver()
        instance.register(mimeType: Bmp())
        instance.register(mimeType: Gif())
        return instance
    }()

    public func register(mimeType: MIME) {
        guard case .none = registeredTypes[mimeType.contentType] else { return }
        registeredTypes[mimeType.contentType] = mimeType
        updateMaxSignatureBytesCount()
    }

    public func unregister(mimeType: MIME) {
        if let _ = registeredTypes.removeValue(forKey: mimeType.contentType) {
            updateMaxSignatureBytesCount()
        }
    }
    
    public func resolve(data: Data) -> MIME? {
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
