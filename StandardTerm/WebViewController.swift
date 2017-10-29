//
//  WebViewController.swift
//  StandardTerm
//
//  Created by admin on 2017. 10. 29..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    var urlData:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        let url = URL(string : "http://data.seoul.go.kr/openinf/sheetview.jsp?infId=OA-1121&tMenu=11")
        let url = URL(string : urlData)
        myWebView.loadRequest(URLRequest(url: url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
