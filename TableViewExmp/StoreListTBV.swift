//
//  StoreListTBV.swift
//  TableViewExmp
//
//  Created by Ali Farhat on 4/10/17.
//  Copyright (c) 2017 ali farhat. All rights reserved.
//

import UIKit

class StoreListTBV: UITableViewController {


    
    var storeList = [Store]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.loadRecords()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return storeList.count
        
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StoreTVC
        
        
        let s = storeList[indexPath.row] as Store
        
        cell.lblName.text = s.storeName
        cell.lblDesc.text = s.storeDesc
        cell.lblPhone.text = s.storePhone
        
        cell.imgvImage.image = UIImage(named: s.storeImageName)
        
        return cell
        
    }
    

    

    // MARK: - Navigation

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "details"
        {
            
           // if let indexPath = tableView.indexPathForCell(sender as UITableViewCell)
            
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let s = storeList[indexPath.row] as Store
                
                let dvc = segue.destination as! DetailsVC
         
                dvc.store = s
            
            }

        }
        
        
        
    }
   
    /*********************************************************************
     *
     *   This function is responsible for calling web services and receives
     *   back data
     *
     ********************************************************************/
    
    func loadRecords()
    {
        
        // 1 - URL String contain the page address
        let urlString =  "https://afarhat.000webhostapp.com/storeslisting1.php"
        
        
        // 2 - Get the URL Session configuration
        
        let config = URLSessionConfiguration.default
        
        // 3 - Create a session that is responsible of communication with server
        
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: nil)
        
        
        // 4 - Create the URL Object
        
        
        let url = URL(string: urlString)
        
        // if valid url 
        
        if url != nil
        {
            
            // 5 - Create the url request
            let request  = URLRequest(url: url!)
            
            // 6 - Execute the request 
            
            let tData = session.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
                
                if (data != nil)
                {
                    // Conver the data to a string
                    let dataString = NSString( data: data!, encoding: String.Encoding.utf8.rawValue)
                    
                    print("\(dataString!)")
                    
                   
                    // Convert the data to JSON Format
                    let parsedStores = (try! JSONSerialization.jsonObject(with: data!, options: [])) as! NSDictionary
                    
                    
                    print("JSON Data \n \(parsedStores)")
                    
                    if let result = parsedStores as? [String: AnyObject] {
                        if let stores:AnyObject = result["Stores"]
                        {
                            print("Horray")
                            
                            self.parseJSON(stores)
                            
                        }
                    }
                    
                    
                    
                } else
                    
                {   // we got an error
                    print("No Wifi")
                    //   self.wifi = false
                    print("Error getting stores :\(error!.localizedDescription)")
                    
                }
                
                
            })
            
            
            tData.resume()
            
            
            
        }
        
      
        
        
    }

    

    
    
    /*********************************************************************
    *
    *   This function is responsible of parsing out json data
    *
    ********************************************************************/
    
    func parseJSON(_ jsonData:AnyObject)
    {
        
        
        
        var store:Store;
        
        if let storeData = jsonData as? [[AnyHashable: Any]]
        {
            
            
            for s in storeData
            {
                store = Store()
                
                
                if let sId:String = s["storeID"] as? String
                {
                        print("Store id = \(sId)")
                    
                }
                
                if let sn:String = s["storeName"] as? String
                {
                        store.storeName = sn
                }
        
                
                if let simgn:String = s["storeImageName"] as? String
                {
                        store.storeImageName = simgn
                }
                
                
                if let slat:String = s["storeLat"] as? String
                {
                    store.storeLat = Float(slat)!
                    
                }
                
                
                if let slng:String = s["storeLng"] as? String
                {
                        store.storeLng = Float(slng)!
                    
                }
                
                storeList += [store]
                
                
            }
            
            
            OperationQueue.main.addOperation() {
                
                // update the presentation layer
                
                self.tableView.reloadData()
                
                //  self.tableView.reloadSections(NSIndexSet(index: 0),withRowAnimation: .Automatic)
                
            }
            

        
        }
        

        
    }

   
    
    /*********************************************************************
    *
    *
    *  This function downloads images for each record
    *
    ********************************************************************/
    
    func loadImages(_ store:Store, indexPath:IndexPath)
    {
        
        
    }
    

    

    
    

}
