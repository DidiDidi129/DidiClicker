//
//  DebugView.swift
//  DidiClicker
//
//  Created by Didi on 12/1/24.
//

import SwiftUI
import SwiftUICore
struct DebugView: View {
    
    
    @Binding var Didi: Int
    @Binding var Slave: Int
    @Binding var Office: Int
    @Binding var Butler: Int
    @Binding var Plane: Int
    var body: some View {
        VStack {
            Text("Slaves \(Slave)")
            Text("Office \(Office)")
            Text("Butler \(Butler)")
            Text("Plane \(Plane)")
            Text("Didi \(Didi)")
            VStack {
                Button(action: {
                    
                }) {
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
                        Button(action: {
                            Didi = 0
                            Office = 0
                            Butler = 0
                            Plane = 0
                            Slave = 0
                        }) {
                            HStack {
                                Text("Reset Me!")
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
            }
        }
    }
    #Preview {
        ContentView()
    }

