import SwiftUI

struct MainView: View {
    @Binding var Didi: Int
    @Binding var Slave: Int
    @Binding var Office: Int
    @Binding var Butler: Int
    @Binding var Plane: Int
    @Binding var dpc: Int
    @State private var timer: Timer? = nil

    var body: some View {
        VStack {
            Text("You currently have:")
                .bold()
                .font(.system(size: 36))
            Text("\(Didi) Didi's")
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
        dpc = Slave * 2 + Office * 10 + Butler * 1000 + Plane * 10000
        if dpc == 0 {
            dpc = 1
        }
    }

    private func startTimer() {
        stopTimer() // Stop any existing timer to avoid duplicates
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if (Slave < 1) {
                stopTimer()
            }
            Didi += dpc
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
