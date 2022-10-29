//
//  MainView.swift
//  WhatsAppLink
//
//  Created by agmcoder on 26/10/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainVM : MainViewModel
    var body: some View {
        VStack {
            // main screen with textfield and button in the middle
            VStack(alignment: .center) {
                Text("WhatsAppLink")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.theme.accent)
                        .padding(.bottom, 20)

                HStack (spacing: 10){
                    //button showing the country code
                    Button(action: {
                        //action
                    }, label: {
                        Text("+34")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.theme.accent)
                                .cornerRadius(5)
                                .padding(5)
                    })
                            .background(Color.theme.codeCountry)
                            .clipShape(Capsule())


                    TextField("Enter phone number", text: $mainVM.textNumber)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .padding()
                            //.background(Color.theme.fontColor)
                            .cornerRadius(5.0)

                }
                        .padding(.horizontal, 20)
                //button to open WhatsApp
                Button(action: {
                    // open WhatsApp
                    mainVM.openWhatsApp()

                }, label: {
                    Text("Open WhatsApp")
                            .foregroundColor(.theme.accent)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                })
                        .cornerRadius(8)
            }
            Button(action:{}, label: {})
                    .alert(isPresented: $mainVM.isNeededToInstallWhatsApp,
                            content: {
                                Alert(
                                        title: Text("WhatsApp not installed"),
                                        message: Text("Please install WhatsApp to use this app"),
                                        dismissButton: .default(Text("Continue"),
                                                action: {
                                                    mainVM.openAppStore()
                                                }
                                        )
                                )
                            }
                    )
        }
    }
}

struct MainView_Previews_dark: PreviewProvider {
    static var previews: some View {
        MainView(mainVM:   MainViewModel())
                .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainVM: MainViewModel())
    }
}
