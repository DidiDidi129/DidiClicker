//
//  ContentView.swift
//  DidiClicker
//
//  Created by Didi on 11/24/24.
//

import SwiftUI

struct ContentView: View {
    

    var body: some View {
        @AppStorage("Didi") var didi: Int = 1
        @AppStorage("EddieSlave") var slave: Int = 0
        @AppStorage("Office") var office: Int = 0
        @AppStorage("Butler") var butler: Int = 0
        @AppStorage("plane") var plane: Int = 0
        VStack {
            
            
            Image(systemName: "hand.rays.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("DidiCicker")
        }
        .padding()
        Spacer()
        TabView {
            Tab("Main", systemImage: "hand.rays.fill") {
                MainView()
            }
            Tab("Shop", systemImage: "bag") {
                ShopView(Didi: $didi)
            }


            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
