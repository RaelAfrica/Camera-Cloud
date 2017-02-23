//
//  Photo.swift
//  Camera and Cloud
//
//  Created by Rael Kenny on 2/7/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    var comments:[String]
    let downloadURL:String
    var likes : Int! = 0
    var name : String!
    
//    initalizer
    init(comments:[String],
        downloadURL:String,
        likes:Int) {
        
        self.comments = comments
        self.downloadURL = downloadURL
        self.likes = likes
    }
    

}
