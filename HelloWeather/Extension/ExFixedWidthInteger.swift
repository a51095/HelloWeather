//
//  ExFixedWidthInteger.swift
//  DevHelper
//
//

public extension FixedWidthInteger {
    /// Int to Float
    var f: Float { Float(self) }
    
    /// Int to CGFloat
    var cgf: CGFloat { CGFloat(self) }
    
    /// Int to Double
    var d: Double { Double(self) }
    
    /// Int to String
    var str: String { String(format: "\(self)" ) }
}
