//
//  MIMEResolver.swift
//  MIMEResolver
//
//  Created by Jakub Petrík on 10/15/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

public final class MIMEResolver {
    internal private(set) var registeredTypes = [String: MIME.Type]()
    internal private(set) var maxSignatureBytesCount = 0

    public init() {}

    private func updateMaxSignatureBytesCount() {
        maxSignatureBytesCount = registeredTypes.values.reduce(0) {
            max($0, $1.signature.count)
        }
    }

    public func register(mimeType: MIME.Type) {
        guard case .none = registeredTypes[mimeType.contentType] else { return }
        registeredTypes[mimeType.contentType] = mimeType
        updateMaxSignatureBytesCount()
    }

    public func unregister(mimeType: MIME.Type) {
        if let _ = registeredTypes.removeValue(forKey: mimeType.contentType) {
            updateMaxSignatureBytesCount()
        }
    }
    
    public func resolve(_ data: Data) -> MIME.Type? {
        var bytes = [UInt8](repeating: 0, count: maxSignatureBytesCount)
        data.copyBytes(to: &bytes, count: maxSignatureBytesCount)

        var mime: MIME.Type?

        for mimeType in registeredTypes.values {
            let currentSignature = Array(bytes.prefix(mimeType.signature.count))
            if mimeType.signature == currentSignature {
                mime = mimeType
                break
            }
        }

        return mime
    }
}
