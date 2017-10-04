//
//  RecallDO.swift
//  bInform
//
//  Created by Darin Williams on 10/1/17.
//  Copyright © 2017 dwilliams. All rights reserved.
//


import UIKit

class RecallDO{
    
    var desc: String
    var manuName: String
    var photo: UIImage?
    
    init?(desc: String, manuName: String, photo: UIImage?){
        
        //if description or manufactureName is empty fail initialization
        if desc.isEmpty || manuName.isEmpty{
            return nil
        }
        
        //Stored properties
        self.desc = desc
        self.manuName = manuName
        self.photo = photo
        
    }
    
    

    
}
