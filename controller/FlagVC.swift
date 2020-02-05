

import UIKit

class FlagVC: UIViewController
{

    // creating the  flag buttons
    @IBOutlet weak var whiteButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
    
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    let entityName = "Cricket"
    
    let cricketer = "cricketer"
    
    let flag = "flag"
    
    let name = "name"
    
    
    var preparedFlagData = ""

    
    let colors = ["White","Yellow","Orange","Green"]
    
    var allButton = [UIButton]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       configureAllButton()
    }
    
    func prepareFlagString()
    {
        for x in MyData.shared.flag
        {
            preparedFlagData += x + ","
        }
    }
    
    
    // creating the eventhandler buttons
    @objc func selectionButtonEH(button:UIButton)
    {
        if(button.backgroundColor == UIColor.red)
        {
           
            button.backgroundColor = .green
        }
        else
        {
            button.backgroundColor = .red
        }
    }
    
    
    func addDataToDatabase()
    {
        CRUD.insertValue(entitiyName: entityName, key1: cricketer, key2: flag, key3: name, value1: MyData.shared.cricketers, value2: preparedFlagData, value3: MyData.shared.name)
    }
    
    
    func configureAllButton()
    {
        
        allButton = [whiteButton,yellowButton,orangeButton,greenButton]
               
        
        
               for x in allButton
               {
                x.addTarget(self, action: #selector(selectionButtonEH(button:)), for: UIControl.Event.touchUpInside)
                x.backgroundColor = .red
               }
    }
    
    
    @IBAction func nextButton(_ sender: Any)
    {
        storeFlagInfo()
        
        if(MyData.shared.flag.count != 0)
        {

                prepareFlagString()
                
                addDataToDatabase()
                
                popToFirstScreen()

        }
        else
        {
            let alert = Alert.addAlert(title: "Message", message: "Please Select Atleast One")

            present(alert, animated: true, completion: nil)
        }

        
        
            }
    // storing the flag information
    
    func storeFlagInfo()
    {
        var flags = [String]()
        
                for i in 0...allButton.count-1
                {
                    if(allButton[i].backgroundColor == .green)
                    {
                        flags.append(colors[i])
                    }
                }
        
                MyData.shared.flag = flags
        
    }
    
    //
    func popToFirstScreen()
    {
        MyData.shared.finishClicked = true
        
        navigationController?.popViewController(animated: false)
    }
    
    // creating the history button 
    @IBAction func historyEH(_ sender: Any)
    {
        storeFlagInfo()
        
        
        
        if(MyData.shared.flag.count != 0)
        {
            
            if(CRUD.fetchData(entityName: entityName).count != 0)
            {
                prepareFlagString()
                
                addDataToDatabase()
                


                let targetVC = self.storyboard?.instantiateViewController(identifier: "SummaryVC")


                self.navigationController?.pushViewController(targetVC!, animated: true)

            }
            else
            {
                let alert = Alert.addAlert(title: "Message", message: "No Records To Show")
                present(alert, animated: true, completion: nil)
                
            }
        }
        else
        {
            let alert = Alert.addAlert(title: "Message", message: "Please Select Atleast One")

            present(alert, animated: true, completion: nil)
        }


    }
    
    
    
    
    @IBAction func deleteAllRecordsEH(_ sender: Any)
    {
        CRUD.deleteAll(entityName: "Cricket")
    }
    


}
