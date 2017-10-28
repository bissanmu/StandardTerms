//
//  Term.swift
//  StandardTerm
//
//  Created by admin on 2017. 10. 22..
//  Copyright © 2017년 admin. All rights reserved.
//

import Foundation
import UIKit

class Term {
    var obj_knm:String
    var obj_enm:String
    var eng_full_nm:String
    var description:String
    
    init(obj_knm:String, obj_enm:String, eng_full_nm:String, description:String) {
        self.obj_knm = obj_knm
        self.obj_enm = obj_enm
        self.eng_full_nm = eng_full_nm
        self.description  = description
    }
}

