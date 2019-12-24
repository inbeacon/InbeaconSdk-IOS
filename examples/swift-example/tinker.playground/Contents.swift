import UIKit

#if swift(>=5.2)
print("Hello, Swift 5.2")
#elseif swift(>=5.1.3)
print("Hello, Swift 5.1.3")
#elseif swift(>=5.1.2)
print("Hello, Swift 5.1.2")
#elseif swift(>=5.1.1)
print("Hello, Swift 5.1.1")
#elseif swift(>=5.1)
print("Hello, Swift 5.1")
#endif
var a=3
func testguard(a: Int) {
    guard a>2 else {
        print("WTF")
        return
    }
    print("Its fine")
}
testguard(a:2)
testguard(a:3)

