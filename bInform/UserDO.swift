//
//  UserDO.swift
//  bInform
//
//  Created by Darin Williams on 10/1/17.
//  Copyright © 2017 dwilliams. All rights reserved.
//

import Foundation

class UserDO{
    

    var emailAddr: String
    var password: String

    init(){
        emailAddr = ""
        password = ""
    }

    func getDescription()->String{
        return emailAddr + "::" + password
    }
}
