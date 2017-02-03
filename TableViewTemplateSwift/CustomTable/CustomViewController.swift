//
//  CustomViewController.swift
//  TableViewTemplateSwift
//
//  Created by Developer on 11/14/16.
//  Copyright © 2016 Tatbiqy. All rights reserved.
//

import UIKit


class CustomViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var customTableView: UITableView!
    
    
    //MARK: - Data Model
    var dataArray = [CustomDataType]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register the cell xib file
        let nib = UINib(nibName: "CustomTableViewCell", bundle:nil)
        customTableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        // Do any additional setup after loading the view.
        customTableView.delegate = self
        customTableView.dataSource = self
        //
        customTableView.backgroundColor = UIColor.clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension CustomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //
        cell.backgroundColor = UIColor.clear
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        cell.delegate = self
        cell.index = indexPath
        cell.configureCell(dataArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // do something here
    }
}

extension CustomViewController: CustomTableViewCellDelegate {
    func buttonDidTapped(_ cell: CustomTableViewCell) {
        //Do action based on the cell or the index or the data model
    }
}
