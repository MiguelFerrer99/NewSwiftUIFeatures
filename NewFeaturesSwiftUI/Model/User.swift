//
//  User.swift
//  NewFeaturesSwiftUI
//
//  Created by Miguel Ferrer Fornali on 13/6/21.
//

import Foundation

struct User: Identifiable, Decodable {
    var id:Int
    var name:String
    var username:String
    var email:String
}
