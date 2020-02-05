
import UIKit

class CricketerVC: UIViewController
{
    
    // creating the label and  pickerview
    
    @IBOutlet weak var selectionLabel: UILabel!
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    var allValues = [String:String]()
    
    
    let cricketers = ["Sachin Tendulkar","Virat Kolli","Adam Gilchirst","Jacques Kallis"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        selectionLabel.text = "Select One"
        
        // calling the function
        createPickerView()
    }
    
    // creating the action button to change the next page
    @IBAction func nextButtonEH(_ sender: Any)
    {
        
        if(selectionLabel.text == "Select One")
        {
            // creating the alert controller 
            let alert = Alert.addAlert(title: "Message", message: "Please Select One")
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            
            MyData.shared.cricketers = selectionLabel.text!
            
            
            let targetVC = self.storyboard?.instantiateViewController(identifier: "FlagVC")
                         
                         
                         self.navigationController?.pushViewController(targetVC!, animated: true)
        }
       
    }
    
}





//Extension For Picker View
extension CricketerVC:UIPickerViewDataSource,UIPickerViewDelegate
{
    
    
    func createPickerView()
    {
        
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.frame = CGRect(x: 0, y: 300, width: view.bounds.width, height: 300)
        view.addSubview(pickerView)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return cricketers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return cricketers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectionLabel.text = cricketers[row]
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if(MyData.shared.finishClicked)
        {
            navigationController?.popViewController(animated: false)
        }
    }
    
}
