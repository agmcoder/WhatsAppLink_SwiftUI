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
    @Published var isWhatsAppInstalled = false
    @Published var isShowingAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var alertButtonTitle = ""

    init() {
        checkIfWhatsAppIsInstalled()
    }

    func checkIfWhatsAppIsInstalled(){
        if let url = URL(string: "whatsapp://send?text=Hello") {
            if UIApplication.shared.canOpenURL(url) {
                isWhatsAppInstalled = true
            } else {
                isWhatsAppInstalled = false
            }
        }
    }

    func openWhatsApp(){
        if isWhatsAppInstalled{
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
}
