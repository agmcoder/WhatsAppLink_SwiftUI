//
//  MainView.swift
//  WhatsAppLink
//
//  Created by agmcoder on 26/10/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainVM: MainViewModel
    var body: some View {
        VStack {
            // main screen with textfield and button in the middle
            VStack(alignment: .center) {
                Text("WhatsAppLink")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.theme.accent)
                        .padding(.bottom, 20)

                HStack(spacing: 10) {
                    //button showing the country code
                    Button(action: {
                        mainVM.showSelectCountry = true
                    }, label: {
                        Text(mainVM.selectedCountry.dialCode)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.theme.accent)
                                .cornerRadius(5)
                                .padding(5)
                    })
                            .background(Color.theme.codeCountry)
                            .clipShape(Capsule())
                            .sheet(
                                    isPresented: $mainVM.showSelectCountry,
                                    onDismiss: { mainVM.showSelectCountry = false },
                                    content: { SelectCountryView(mainViewModel: mainVM).interactiveDismissDisabled() }
                            )

                    // textfield to introduce phone number
                    TextField("Enter phone number", text: $mainVM.textNumber)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .padding()
                            //.background(Color.theme.fontColor)
                            .cornerRadius(5.0)

                }
                        .padding(.horizontal, 20)
                //button to open WhatsApp
                Button(
                        action: {
                            mainVM.checkIfWhatsAppIsInstalled()
                            print(mainVM.isNeededToInstallWhatsApp)
                            mainVM.isNeededToInstallWhatsApp ? mainVM.showCustomAlert() : mainVM.openWhatsApp()
                        },
                        label: {
                            Text("Open WhatsApp")
                                    .foregroundColor(.theme.accent)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                        }
                        //disable button if textfield is empty or if textfield has less than 9 characters
                )
                        .disabled(mainVM.textNumber.isEmpty || mainVM.textNumber.count < 9)
                        .buttonStyle(.bordered)
                        .cornerRadius(8)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainVM: MainViewModel())
    }
}
