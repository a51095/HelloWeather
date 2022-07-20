//
//  ExObject.swift
//  DevHelper
//
//

public extension NSObject {
    /// 获取当前类的名称字符串(静态方法)
    static func classString() -> String { NSStringFromClass(classForCoder()) }
    
    /// 获取当前对象所属类的名称字符串(对象方法)
    func classString() -> String { NSStringFromClass(classForCoder) }
}
