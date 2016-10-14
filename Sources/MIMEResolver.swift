//
//  MIMEResolver.swift
//  MIMEResolver
//
//  Created by Jakub Petrík on 10/15/16.
//  Copyright © 2016 Inloop, s.r.o. All rights reserved.
//

public final class MIMEResolver {
    private var registeredTypes = [String: MIME]()

    public static let `default` = MIMEResolver()

    public func register(mimeType: MIME) {
        registeredTypes[mimeType.contentType] = mimeType
    }

    public func unregister(mimeType: MIME) {
        registeredTypes.removeValue(forKey: mimeType.contentType)
    }

    
    public func resolve(data: Data) -> Never {
        fatalError("Not yet implemented")
    }
}
