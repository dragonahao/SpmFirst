import Foundation

@objcMembers
open class LibraryA: NSObject {
    open var name: String?

    open func printHello() {
        print("Hello from LibraryA")
    }
}
