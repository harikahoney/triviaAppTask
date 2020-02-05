

import UIKit


// creating the singleton
class MyData: NSObject
{
    // storing the data in to array
     var name = String()
     var cricketers = String()
    var flag = [String]()
    var finishClicked = false

    
    static var shared = MyData()
    
        
    private override init()
    {
        super.init()
    }
}
