import Foundation
import SwiftLibraryFirstSubA

@objcMembers
open class ZZPackage: NSObject {
    var computedName: String {
        return "ZZPackage-computed-name"
    }

    public func publicMethod() {
        LibraryA().printHello()  // vscode对子包的make sense 不友好，能用但是没提示
        // LibraryB() //没有导入SwiftLibraryFirstSubB无法使用
    }

    open func openMethod() {
        print("ZZPackage open method")
        self.publicMethod()
        self.privateMethod()
        self.internalMethod()
    }

    private func privateMethod() {
        print("ZZPackage private method")
    }

    internal func internalMethod() {
        print("ZZPackage internal method")
    }
}
