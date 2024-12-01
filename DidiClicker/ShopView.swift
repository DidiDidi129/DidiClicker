//
//  ShopView.swift
//  DidiClicker
//
//  Created by Didi on 11/24/24.
//
import SwiftUI
import SwiftUICore
struct ShopView: View {
    @Binding var Didi: Int
    @Binding var Slave: Int
    @Binding var Office: Int
    @Binding var Butler: Int
    @Binding var Plane: Int
    var body: some View {

        Text("You have \(Didi) Didi's available to spend")
        Spacer()
        List {
            Button(action: {
                if (Didi < 5) {
                    
                }
                else {
                    Slave += 1
                    Didi -= 5
                }
            }) {
                Text("Eddie Slave")
                }
            Button(action: {
                if (Didi < 100) {
                    
                }
                else {
                    Office += 1
                    Didi -= 100
                }            }) {
                Text("DidiLand Office")
                }
            Button(action: {
                if (Didi < 10000) {
                    
                }
                else {
                    Butler += 1
                    Didi -= 10000
                }
            }) {
                Text("Tiger Butler")
                }
            Button(action: {
                if (Didi < 100000) {
                    
                }
                else {
                    Office += 100000
                    Didi -= 100
                }
            }) {
                Text("Burger Plane")
                }
            }
        }
    }


#Preview {
    ContentView()
}
