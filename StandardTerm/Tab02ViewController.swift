//
//  Tab02ViewController.swift
//  StandardTerm
//
//  Created by admin on 2017. 10. 29..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit
import CoreData

class Tab02ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    var voca = [Voca]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest: NSFetchRequest<Voca> = Voca.fetchRequest()
        do{
            let voca = try PersistenceService.context.fetch(fetchRequest)
            self.voca = voca
            self.tableView.reloadData()
        } catch {}
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onPlusTapped(){
        let alert = UIAlertController(title : "표준용어 추가" , message : nil , preferredStyle : .alert)
        alert.addTextField{ (textField) in
            textField.placeholder = "한글명"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "영문약어"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "영문풀네임"
        }
        let action = UIAlertAction(title : "추가", style : .default){ (_) in
//            let obj_knm = alert.textFields?.first?.text
//            let obj_enm = alert.textFields?.last?.text
//            let eng_full_nm = alert.textFields.
            let obj_knm = alert.textFields![0].text
            let obj_enm = alert.textFields![1].text
            let eng_full_nm = alert.textFields![2].text
            
            print(obj_knm)
            print(obj_enm)
            print(eng_full_nm)
            
            let voca = Voca(context: PersistenceService.context)
            voca.obj_knm = obj_knm
            voca.obj_enm = obj_enm
            voca.eng_full_nm = eng_full_nm
            PersistenceService.saveContext()
            self.voca.append(voca)
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
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

extension Tab02ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("voca count : \(voca.count)")
        return voca.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier02", for: indexPath) as! Tab02TableViewCell
//      cell.textLabel?.text = voca[indexPath.row].obj_knm
//      cell.detailTextLabel?.text = voca[indexPath.row].obj_enm
        cell.obj_knm.text = voca[indexPath.row].obj_knm
        cell.obj_enm.text = voca[indexPath.row].obj_enm
        cell.eng_full_name.text = voca[indexPath.row].eng_full_nm
        print(voca[indexPath.row].obj_knm)
        print(voca[indexPath.row].obj_enm)
        print(voca[indexPath.row].eng_full_nm)
        
        return cell
    }
}
