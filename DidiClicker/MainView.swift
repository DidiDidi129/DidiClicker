//
//  ShopView.swift
//  DidiClicker
//
//  Created by Didi on 11/24/24.
//
import SwiftUI
import SwiftUICore

struct MainView: View {
    @Binding var Didi: Int
    @Binding var Slave: Int
    @Binding var Office: Int
    @Binding var Butler: Int
    @Binding var Plane: Int
    @Binding var dpc: Int
    var body: some View {
        Text("You currently have:")
            .bold()
            .font(.system(size: 36))
        Text("\(Didi) Didi's")
            .bold()
            .font(.system(size: 36))
        Spacer()
        Button(action: {
            dpc = Slave * 10 + Office * 100 + Butler * 10000 + Plane * 100000 + 1000000
            Didi += dpc
        }) {
            HStack {
                Text("Click Me!")
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 370, height: 80)
                    .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color.blue)
                        .shadow(radius: 1)
                    )
                    .padding()
            }
        }

    }
}



#Preview {
    ContentView()
}
