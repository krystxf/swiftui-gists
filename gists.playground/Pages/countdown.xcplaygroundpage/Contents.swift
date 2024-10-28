import PlaygroundSupport
import SwiftUI

//: ## Live countdown

struct PlaygroundView: View {
    var body: some View {
        VStack(spacing: 20) {
            CountdownView(targetDate: .now).font(.title)
            CountdownView(targetDate: .now + (10 * 60)).font(.title)
            CountdownView(targetDate: .now + (10 * 60 * 60)).font(.title)
            CountdownView(targetDate: .now - (10 * 60 * 60)).font(.title)
            CountdownView(targetDate: .now + (10 * 60)) { "Time remaining: \($0)" }.font(.title)
        }
    }
}

PlaygroundPage
    .current
    .setLiveView(
        PlaygroundView().frame(width: 500.0, height: 500.0)
    )
