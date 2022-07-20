//
//  ExObject.swift
//  DevHelper
//
//

public extension NSObject {
    /// classString
    static func classString() -> String { NSStringFromClass(classForCoder()) }
    
    /// classString
    func classString() -> String { NSStringFromClass(classForCoder) }
}
