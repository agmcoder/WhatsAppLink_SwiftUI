//
//  MainView.swift
//  WhatsAppLink
//
//  Created by agmcoder on 26/10/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject  var  mainVM = MainViewModel()
    var body: some View {
        VStack{
            // main screen with txtfield and button in the middle
            VStack(alignment: .center){
                Text("WhatsAppLink")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.theme.accent)
                    .padding(.bottom, 20)
                //outlined textfield type number
                HStack{
                    //buttom showing the country code
                    Button(action: {
                        //action
                    }, label: {
                        Text("+34")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.theme.accent)
                            .padding(.horizontal, 10)
                            //.padding(.vertical, 5)
                            //.background(Color.theme.accent)
                            .cornerRadius(5)
                    })

                    
                    TextField("Enter phone number", text: $mainVM.textNumber)
                        .keyboardType(.numberPad)
                        .padding()
                    //.background(Color.theme.fontColor)
                        .cornerRadius(5.0)
                        //.padding(.bottom, 20)
                    
                    
                }


                Button(action: {
                    // open whatsapp
                }, label: {
                    Text("Open WhatsApp")
                        .foregroundColor(.theme.accent)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                })
                .cornerRadius(8)
            }
        }
    }
}


//preview in darkmode
struct MainView_Previews_dark: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
