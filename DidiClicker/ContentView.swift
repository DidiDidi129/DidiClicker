//
//  ContentView.swift
//  DidiClicker
//
//  Created by Didi on 11/24/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("Didi") var didi: Int = 0
    @AppStorage("Slave") var slave: Int = 0
    @AppStorage("Office") var office: Int = 0
    @AppStorage("Butler") var butler: Int = 0
    @AppStorage("plane") var plane: Int = 0
    @State var dpc: Int = 1

    var body: some View {
        
        VStack {
            
            
            Image(systemName: "hand.rays.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("DidiCicker")
        }
        .padding()
        Spacer()
        TabView {
            MainView(Didi: $didi, Slave: $slave, Office: $office, Butler: $butler, Plane: $plane, dpc: $dpc)
                .tabItem {
                    Label("Main", systemImage: "hand.rays.fill")
                }
            ShopView(Didi: $didi, Slave: $slave, Office: $office, Butler: $butler, Plane: $plane)
                .tabItem {
                    Label("Shop", systemImage: "bag")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            DebugView(Didi: $didi, Slave: $slave, Office: $office, Butler: $butler, Plane: $plane)
                .tabItem {
                    Label("Debug", systemImage: "gear")
                }

        }
    }
}

#Preview {
    ContentView()
}
