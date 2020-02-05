

import UIKit

class ViewController: UIViewController
{
    // creating the question lbl,nametextfield,next button
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
    }

     // creating the action button to change the next page
    @IBAction func nextButtonEH(_ sender: Any)
    {
        
        if(textfield.text != "")
        {
            MyData.shared.name = textfield.text!
            
            let targetVC = self.storyboard?.instantiateViewController(identifier: "CricketerVC")
            
            
            self.navigationController?.pushViewController(targetVC!, animated: true)
        }
        else
        {

            
            let alert = Alert.addAlert(title: "Message", message: "Name Cannot Be Empty")
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if(MyData.shared.finishClicked)
        {
            MyData.shared.finishClicked = false
            
            textfield.text = ""
        }
    }
    
    // creating the histry button and  changing the nextpage page
    @IBAction func showHistory(_ sender: Any)
    {
                   
                   if(CRUD.fetchData(entityName: "Cricket").count != 0)
                   {
                       

                    // changing the view controller with navigation controller
                       let targetVC = self.storyboard?.instantiateViewController(identifier: "SummaryVC")


                       self.navigationController?.pushViewController(targetVC!, animated: true)

                   }
                   else
                   {
                       let alert = Alert.addAlert(title: "Message", message: "No Records To Show")
                       present(alert, animated: true, completion: nil)
                       
                   }
               
    }
    
    
}

