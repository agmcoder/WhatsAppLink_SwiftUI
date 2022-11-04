//
//  CountriesAPI.swift
//  WhatsAppLink
//
//  Created by agmcoder on 3/11/22.
//

import Foundation



final class CountriesAPI{


    func fetchCountries() async throws -> [Country]? {

        guard let url = URL(string: CountryUrl.countriesJSON.rawValue ) else {
            print("Invalid URL")
            return nil
        }
        let urlRequest = URLRequest(url: url)
        do {
            let (json, _) = try await URLSession.shared.data(for: urlRequest)

            if let decodedResponse = try? JSONDecoder().decode([Country].self, from: json) {
                debugPrint("return decodeResponse")
                return decodedResponse
            }
        } catch {
                debugPrint("error data")
            
        }
        return nil

    }

}
