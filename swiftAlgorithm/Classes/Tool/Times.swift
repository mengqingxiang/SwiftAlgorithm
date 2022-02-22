//
//  Times.swift
//  swiftAlgorithm
//
//  Created by 孟庆祥 on 2022/2/22.
//


public class Times {
    public typealias taskClosure = (()->Void)
    
    public static func doTask(taskName:String,task:taskClosure?) {
        print("\(taskName)")
        guard let task = task else { return }
        let beginTime = Date().timeIntervalSince1970
        task()
        let endTime = Date().timeIntervalSince1970
        print("耗时：\(endTime-beginTime) \n")
    }
}
