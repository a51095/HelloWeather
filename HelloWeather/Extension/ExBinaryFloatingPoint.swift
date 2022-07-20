//
//  ExBinaryFloatingPoint.swift
//  DevHelper
//
//

public extension BinaryFloatingPoint {
    /// Float to Int
    var i: Int { return Int(self) }
    
     var cleanZero : String {
        if let i = Int(exactly: self) { return String(i) }
        return String(Double(self))
    }
}
