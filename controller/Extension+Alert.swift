

import UIKit

struct Alert
{
    static func addAlert(title:String,message:String) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                   
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                   
        alert.addAction(okAction)
        
        return alert
                   
                  
    }
}
