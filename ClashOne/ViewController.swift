//
//  ViewController.swift
//  ClashOne
//
//  Created by Eduardo on 22/01/2019.
//  Copyright © 2019 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit
import Alamofire



struct DataApi: Codable{
    var type: String?
    var name: String?
    var description: String?
    var idName: String?
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    let API_URL = "http://www.clashapi.xyz/api/cards"
    
    var laData = [DataApi]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(API_URL).responseJSON { response in
            let json = response.data
            do{
                let decoder = JSONDecoder()
                
                self.laData = try decoder.decode([DataApi].self, from: json!)
                if self.laData.count > 0{
                self.tableView.reloadData()
                   
                }
            }catch let err{
                print(err)
            }
        }
   }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.laData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        let dict = laData[indexPath.row]
        
        //--->Ordenar alfabeticamente
        
        cell.textLabel?.text = dict.name
        cell.detailTextLabel?.text = dict.type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Detail = UIStoryboard(name: "Main", bundle: nil)
        let SvC = Detail.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
      
        self.navigationController?.pushViewController(SvC, animated: true)
 
    }
    

}

