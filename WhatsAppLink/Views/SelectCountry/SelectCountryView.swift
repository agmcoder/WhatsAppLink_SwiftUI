//
//  SelectCountryView.swift
//  WhatsAppLink
//
//  Created by agmcoder on 4/11/22.
//

import SwiftUI

struct SelectCountryView: View {
    let mainViewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        //List of countries with checkmark
        List(mainViewModel.countries) { country in
            Button(action: {

                //mainVM.showSelectCountry = false
            }, label: {
                HStack {
                    Text(country.dialCode)
                            .foregroundColor(.theme.accent)
                    Text(country.name)
                            .foregroundColor(.theme.accent)
                    Spacer()
                    if mainViewModel.selectedCountry.dialCode == country.dialCode {
                        Image(systemName: "checkmark")
                                .foregroundColor(.theme.accent)
                    }
                }
            })
                    .onTapGesture{
                        mainViewModel.selectedCountry = country
                        presentationMode.wrappedValue.dismiss()
                    }

        }

    }
}

// preview
struct SelectCountryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCountryView(mainViewModel: MainViewModel())
    }
}


