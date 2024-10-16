import Foundation
import SwiftLibraryFirstSubA
import SwiftLibraryFirstSubB
import SwiftLibraryFirstSubOC



@objcMembers
open class ZZPackage: NSObject {
    var computedName: String {
        return "ZZPackage-computed-name"
    }

    public func publicMethod() {
        print("ZZPackage public method")
        LibraryA().printHello()  // vscode对子包的make sense 不友好，能用但是没提示
        // LibraryB() //没有导入SwiftLibraryFirstSubB无法使用

        //LibraryA().printHello()
        SwiftLibraryFirstSubB.LibraryB().printHello()  // xcdoe 对子包的make sense 很友好，能用且有提示

        // call oc
        let bean = SwiftLibraryFirstSubOC.LibraryOCBean()
        bean.fieldName = "bean-name"
        bean.fieldAge = 10
        bean.showOCMethod()
        LibraryOCBean.showOCStaticMethod()
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
