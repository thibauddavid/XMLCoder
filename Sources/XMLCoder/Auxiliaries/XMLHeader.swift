//
//  XMLHeader.swift
//  XMLCoder
//
//  Created by Vincent Esche on 12/18/18.
//

import Foundation

public struct XMLHeader {
    /// the XML standard that the produced document conforms to.
    public let version: Double?

    /// the encoding standard used to represent the characters in the produced document.
    public let encoding: String?

    /// indicates whether a document relies on information from an external source.
    public let standalone: String?
    
    /// Defines whether header is suffixed or not by a \n
    public let appendNewline: Bool

    public init(version: Double? = nil, encoding: String? = nil, standalone: String? = nil, appendNewline: Bool = true) {
        self.version = version
        self.encoding = encoding
        self.standalone = standalone
        self.appendNewline = appendNewline
    }

    func isEmpty() -> Bool {
        return version == nil && encoding == nil && standalone == nil
    }

    func toXML() -> String? {
        guard !isEmpty() else {
            return nil
        }

        var string = "<?xml"

        if let version = version {
            string += " version=\"\(version)\""
        }

        if let encoding = encoding {
            string += " encoding=\"\(encoding)\""
        }

        if let standalone = standalone {
            string += " standalone=\"\(standalone)\""
        }

        string += "?>"
        if appendNewline {
            string += "\n"
        }

        return string
    }
}
