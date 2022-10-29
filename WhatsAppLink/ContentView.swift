//
//  ContentView.swift
//  WhatsAppLink
//
//  Created by agmcoder on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    var mainVM = MainViewModel()
    var body: some View {
        MainView(mainVM: mainVM)

    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
