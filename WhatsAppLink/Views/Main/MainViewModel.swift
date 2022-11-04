//
//  MainViewModel.swift
//  WhatsAppLink
//
//  Created by agmcoder on 28/10/22.
//

import Foundation
import UIKit
//mainviewModel
class MainViewModel: ObservableObject{
    private let defaultCountry = Country(name: "Spain", dialCode: "+34", code: "ES")
    private let WHATSAPP_DOWNLOAD_URL = "https://apps.apple.com/us/app/whatsapp-messenger/id310633997"
    static private let countriesApi = CountriesAPI()
    private let CHARACTER_LIMIT = 10
    @Published var textNumber = ""{
        willSet {
            if textNumber.count >= CHARACTER_LIMIT{
                textNumber = String(textNumber.prefix(CHARACTER_LIMIT))
            }
        }
    }
    
    @Published var isNeededToInstallWhatsApp = false
    @Published var isShowingAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var alertButtonTitle = ""
    @Published var countries = [Country]()
    @Published var selectedCountry:Country
    @Published var showSelectCountry = false



    init(){
        selectedCountry = defaultCountry
        checkIfWhatsAppIsInstalled()
        Task{
            do{
                try await getCountries()
            }catch{
                print("Error while fetching countries", error)
            }
        }
        
    }

    func checkIfWhatsAppIsInstalled(){
        
    }

    func openWhatsApp(){
        if !isNeededToInstallWhatsApp{
            let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(selectedCountry.dialCode)\(textNumber)")!
            if UIApplication.shared.canOpenURL(appURL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
                }
                else {
                    UIApplication.shared.openURL(appURL)
                }
            }
        }else{
            alertTitle = "WhatsApp not installed"
            alertMessage = "Please install WhatsApp to use this app"
            alertButtonTitle = "OK"
        }
    }

    func openAppStore(){
        if let url = URL(string: WHATSAPP_DOWNLOAD_URL) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    func showCustomAlert(){

    }
    //function to get countries from API
    func getCountries() async throws{

        countries = try await MainViewModel.countriesApi.fetchCountries() ?? []
    }
}
