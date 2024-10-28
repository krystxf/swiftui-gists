import SwiftUI

public typealias CustomOutputFunction = (_ formattedTime: String) -> String

public struct CountdownView: View {
    private let targetDate: Date
    private let customFunction: CustomOutputFunction
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @State private var timeRemaining: TimeInterval = 0

    public init(targetDate: Date, customFunction: CustomOutputFunction? = nil) {
        self.targetDate = targetDate
        self.customFunction = customFunction ?? { $0 }
    }

    func updateRemainingTime() {
        timeRemaining = targetDate.timeIntervalSinceNow
    }

    public var body: some View {
        Text(
            customFunction(
                getFormattedTime(timeRemaining)
            )
        )
        .onAppear {
            updateRemainingTime()
        }
        .onReceive(timer) { _ in
            updateRemainingTime()
        }
    }
}
