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
    private let CHARACTER_LIMIT = 10
    @Published var textNumber = ""{
        didSet {
            if textNumber.count > CHARACTER_LIMIT{
                textNumber = String(textNumber.prefix(CHARACTER_LIMIT))
            }
        }
    }
    @Published var isNeededToInstallWhatsApp = true
    @Published var isShowingAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var alertButtonTitle = ""
    @Published var isShowingSheet = false

    private let WHATSAPP_DOWNLOAD_URL = "https://apps.apple.com/us/app/whatsapp-messenger/id310633997"


    init() {
        checkIfWhatsAppIsInstalled()
    }

    func checkIfWhatsAppIsInstalled(){
        let app = UIApplication.shared
        let appScheme = "WhatsApp//app"
        if app.canOpenURL(URL(string: appScheme)!) {
            print("App is install and can be opened")
            isNeededToInstallWhatsApp = false

        }
        else {
            print("App in not installed. Go to AppStore")
            isNeededToInstallWhatsApp = true

        }
    }

    func openWhatsApp(){
        if !isNeededToInstallWhatsApp{
            if let url = URL(string: "whatsapp://send?text=\(textNumber)") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }
        }else{
            alertTitle = "WhatsApp not installed"
            alertMessage = "Please install WhatsApp to use this app"
            alertButtonTitle = "OK"
            isShowingAlert = true
        }
    }

    func openAppStore(){
        if let url = URL(string: WHATSAPP_DOWNLOAD_URL) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}
