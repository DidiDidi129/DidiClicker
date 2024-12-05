import SwiftUI

struct MainView: View {
    @Binding var Didi: Int
    @Binding var Slave: Int
    @Binding var Office: Int
    @Binding var Butler: Int
    @Binding var Plane: Int
    @Binding var dpc: Int
    @State private var timer: Timer? = nil
    @State private var incrementPerMillisecond: Double = 0.0
    @State private var partialDidi: Double = 0.0 // Tracks fractional Didis

    var body: some View {
        VStack {
            Text("You currently have:")
                .bold()
                .font(.system(size: 36))
            Text("\(Didi)")
                .bold()
                .font(.system(size: 36))
            Text("Didi Per Second")
                .bold()
                .font(.system(size: 36))
            Text("\(dpc)")
                .bold()
                .font(.system(size: 36))
            Spacer()
            Button(action: {
                let manualAdd = max(1, dpc / 10) // 1/10th of dpc, minimum of 1
                Didi += manualAdd
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
        .onAppear {
            calculateDPC()
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    private func calculateDPC() {
        dpc = Slave + Office * 100 + Butler * 10000 + Plane * 1000000
        if dpc == 0 {
            dpc = 1
        }
        incrementPerMillisecond = Double(dpc) / 1000.0
    }

    private func startTimer() {
        stopTimer() // Stop any existing timer to avoid duplicates
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            partialDidi += incrementPerMillisecond
            let fullDidi = Int(partialDidi) // Extract full Didis
            partialDidi -= Double(fullDidi) // Retain fractional part
            Didi += fullDidi
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    ContentView()
}
