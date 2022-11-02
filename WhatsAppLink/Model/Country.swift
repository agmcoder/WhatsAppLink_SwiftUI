//
//  Country.swift
//  WhatsAppLink
//
//  Created by agmcoder on 30/10/22.
//

import Foundation
//country phone model
struct Country: Identifiable{
    var id = UUID()
    var name: String
    var code: String
    var phoneCode: String
    var phoneLength: Int
    var phonePattern: String

}
