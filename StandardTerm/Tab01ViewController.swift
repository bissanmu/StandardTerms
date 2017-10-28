//
//  Tab01ViewController.swift
//  StandardTerm
//
//  Created by admin on 2017. 10. 28..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit

class Tab01ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var terms:[Term] = Array()
    var filterTerms:[Term] = Array()
    let maxQty = 2
    let keyStr = "6b7943586a73756e38385278646d51"
    var lastPageNum = 0
    
    let searchController = UISearchController(searchResultsController: nil)
    
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        filterTerms = terms.filter{ term in
            
            return term.obj_knm.contains(searchText)
        }
        
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filterTerms.count
        }
        return terms.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier01", for: indexPath) as! Tab01TableViewCell
        
        // Configure the cell...
        if searchController.isActive && searchController.searchBar.text != "" {
            
            cell.knmLabel?.text = filterTerms[indexPath.row].obj_knm
            cell.enmLabel?.text = filterTerms[indexPath.row].obj_enm
            cell.engFullLabel?.text = filterTerms[indexPath.row].eng_full_nm
        }else{
            cell.knmLabel?.text = terms[indexPath.row].obj_knm
            cell.enmLabel?.text = terms[indexPath.row].obj_enm
            cell.engFullLabel?.text = terms[indexPath.row].eng_full_nm
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        getData(pageNum:2)
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Search here ..."
        tableView.tableHeaderView = searchController.searchBar
        
        print("Total cnt : \(terms.count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(pageNum:Int){
        //let startIdx = pageNum * maxQty
        // let endIdx = startIdx * maxQty
        let startIdx = 1
        let endIdx = 1000
        
        
        let urlStr = "http://openapi.seoul.go.kr:8088/\(keyStr)/json/AdministrationStandardTerms/\(startIdx)/\(endIdx)/"
        print(urlStr)
        //http://openapi.seoul.go.kr:8088/6b7943586a73756e38385278646d51/json/AdministrationStandardTerms/1/1000/
        //http://openapi.seoul.go.kr:8088/6b7943586a73756e38385278646d51/json/AdministrationStandardTerms/1001/2000
        
        let serverURL:URL! = URL(string : urlStr)
        let serverData = try! Data(contentsOf: serverURL)
        let log = NSString(data: serverData, encoding: String.Encoding.utf8.rawValue)
        
        do{
            let dict = try JSONSerialization.jsonObject(with: serverData, options: []) as! NSDictionary
            
            let standardsTermsInfo = dict["AdministrationStandardTerms"] as! NSDictionary
            let results = standardsTermsInfo["row"] as! NSArray
            var list_total_count = standardsTermsInfo["list_total_count"] as! Int
            print(list_total_count )
            getFullData(list_total_count: list_total_count)
            for result in results {
                let resultDict = result as! NSDictionary
                
                let term = Term(obj_knm: (resultDict["OBJ_KNM"] as? String)!,
                                obj_enm: (resultDict["OBJ_ENM"] as? String)!,
                                eng_full_nm: (resultDict["ENG_FULL_NM"] as? String)!,
                                description: (resultDict["DESCRIPTION"] as? String)!)
                
                terms.append(term)
            }
            //print(dict)
        }catch{
            print("Error")
        }
        
        //self.lastPageNum = pageNum
    }
    
    func appendData(start:Int, end:Int){
        
        let urlStr = "http://openapi.seoul.go.kr:8088/\(keyStr)/json/AdministrationStandardTerms/\(start)/\(end)/"
        print(urlStr)
        let serverURL:URL! = URL(string : urlStr)
        let serverData = try! Data(contentsOf: serverURL)
        let log = NSString(data: serverData, encoding: String.Encoding.utf8.rawValue)
        
        do{
            let dict = try JSONSerialization.jsonObject(with: serverData, options: []) as! NSDictionary
            
            let standardsTermsInfo = dict["AdministrationStandardTerms"] as! NSDictionary
            let results = standardsTermsInfo["row"] as! NSArray
            
            for result in results {
                let resultDict = result as! NSDictionary
                
                let term = Term(obj_knm: (resultDict["OBJ_KNM"] as? String)!,
                                obj_enm: (resultDict["OBJ_ENM"] as? String)!,
                                eng_full_nm: (resultDict["ENG_FULL_NM"] as? String)!,
                                description: (resultDict["DESCRIPTION"] as? String)!)
                
                terms.append(term)
            }
            //print(dict)
        }catch{
            print("Error")
        }
        
        //self.lastPageNum = pageNum
    }
    func getFullData(list_total_count:Int){
        var remainder = list_total_count % 1000
        
        let i = list_total_count / 1000 - 1
        
        var startIdx:Int = 1
        var endIdx:Int = 1000
        
        for vari in 1...i {
            startIdx = startIdx + 1000
            endIdx = endIdx + 1000
            appendData(start:startIdx, end:endIdx)
        }
        
        startIdx = startIdx + 1000
        endIdx = endIdx + remainder
        print("remainder : \(remainder)")
        print("endIdx : \(endIdx)")
        appendData(start:startIdx, end:endIdx)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension Tab01ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
        // print(searchController.searchBar.text!)
    }
}

