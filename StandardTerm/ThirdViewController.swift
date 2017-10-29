//
//  ThirdViewController.swift
//  StandardTerm
//
//  Created by admin on 2017. 10. 29..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var infoDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoDescription.text = "행정데이터 표준용어 사전정보 조회 \n 행정정보 공유 활성화를 위해 행정시스템 구축시 사용하는 표준용어로 표준단어명, 영문명, 영문의미, 설명으로 구성되어 있는 정보를 제공합니다. 영문명은 행정시스템 구축시 DB설계(테이블 및 칼럼 명칭)시에 사용하여 시스템 구축시에도 표준화된 용어사용을 통해 시스템간의 연계를 용이하게 돕고 DB의 내용을 효율적으로 파악이 가능하도록 돕습니다."
        
        // Do any additional setup after loading the view.
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
