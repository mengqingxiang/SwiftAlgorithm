//
//  Assert.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/22.
//

import Foundation

public enum AssertError:Error {
    case error(String)
}


public class Asserts {
    public static func test(_ value:Bool,
                            file: NSString = #file,
                            line: Int = #line,
                            fn: String = #function) {
        if !value { assertionFailure("\(file)\(line)\(fn) 测试未通过")}
    }
}
