
import UIKit

class SummaryVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    // creating the tableView outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // storing into the arrays
    var allHeaders = [String]()
    
    var names = [String]()
    
    var flags = [String]()
    
    var cricketer = [String]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        fetchData()
        
        allHeaders = [MyData.shared.name ,MyData.shared.cricketers]
        
        for x in MyData.shared.flag
        {
            allHeaders.append(x)
        }
        
        createTableView()
      
    }
    
    // fetching the data
    func fetchData()
    {
        let data = CRUD.fetchData(entityName: "Cricket")
        
        for x in data
        {
            
            self.names.append(x.value(forKey: "name")! as! String)
            
            self.cricketer.append(x.value(forKey: "cricketer")! as! String)
            
            self.flags.append(x.value(forKey: "flag")! as! String)
        }
    }
    
    
    // tableview
    func createTableView()
    {
        tableView.dataSource = self
        
        tableView.delegate = self
        
    }
    //TableViewDelegates and TableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Game \(section + 1)"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        
        switch indexPath.row
        {
        case 0:
            //cell.textLabel?.text = "Name : " + names[indexPath.section]
            cell.label1.text = "Name"
            cell.label2.text = "Answer : " + names[indexPath.section]
            
        case 1:
            //cell.textLabel?.text = "Who Is The Best Cricketer In The World :       " + cricketer[indexPath.row]
            cell.label1.text = "Who Is The Best Cricketer In The World ?"
             cell.label2.text = "Answer : " + cricketer[indexPath.row]
            
        default:
            var value = flags[indexPath.section]
            value.removeLast()
           // cell.textLabel?.text = "What Are The Colors In The National Flag :       " + value
            
            cell.label1.text = "What Are The Colors In The National Flag ?"
            cell.label2.text = "Answer : " + value
            
            
        }
        
        
        
        
        
        
        return cell
        
    }
    

}
