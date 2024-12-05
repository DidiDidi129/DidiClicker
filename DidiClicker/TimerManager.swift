
//
//  TimerManager.swift
//  DidiClicker
//
//  Created by Didi on 12/5/24.
//

import SwiftUI
import Combine

class TimerManager: ObservableObject {
    @Published var Didi: Int = 0
    @Published var Slave: Int = 0
    @Published var Office: Int = 0
    @Published var Butler: Int = 0
    @Published var Plane: Int = 0
    @Published var dpc: Int = 1

    private var timer: Timer? = nil
    private var incrementPerMillisecond: Double = 0.0
    private var partialDidi: Double = 0.0

    init() {
        calculateDPC()
        startTimer()
    }

    func calculateDPC() {
        dpc = Slave * 10 + Office * 100 + Butler * 10000 + Plane * 1000000
        if dpc == 0 {
            dpc = 1
        }
        incrementPerMillisecond = Double(dpc) / 1000.0
    }

    private func startTimer() {
        stopTimer() // Avoid duplicate timers
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            self.partialDidi += self.incrementPerMillisecond
            let fullDidi = Int(self.partialDidi)
            self.partialDidi -= Double(fullDidi)
            self.Didi += fullDidi
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    deinit {
        stopTimer()
    }
}
