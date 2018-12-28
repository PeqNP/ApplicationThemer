import Foundation
import UIKit

func appDelegateClass() -> String {
    let isRunningTests = NSClassFromString("XCTestCase") != nil
    if isRunningTests {
        return NSStringFromClass(TestAppDelegate.self)
    }
    return NSStringFromClass(AppDelegate.self)
}

let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>?.self, capacity: Int(CommandLine.argc))
_ = UIApplicationMain(CommandLine.argc, args, nil, appDelegateClass())
