//
//  Country.swift
//  WhatsAppLink
//
//  Created by agmcoder on 30/10/22.
//

import Foundation
struct Country: Codable , Identifiable{
    let id = UUID()
    let name, dialCode, code: String

    enum CodingKeys: String, CodingKey {
        case name
        case dialCode = "dial_code"
        case code
    }
}

public enum CountryUrl: String{
    case countriesJSON = "https://gist.githubusercontent.com/anubhavshrimal/75f6183458db8c453306f93521e93d37/raw/f77e7598a8503f1f70528ae1cbf9f66755698a16/CountryCodes.json"
}
