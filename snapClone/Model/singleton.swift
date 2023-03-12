//
//  singleton.swift
//  snapClone
//
//  Created by Oğuzhan Abuhanoğlu on 9.12.2022.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init(){
        
    }
    
    
}
