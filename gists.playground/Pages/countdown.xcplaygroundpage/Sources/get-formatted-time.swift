import Foundation

public func getFormattedTime(_ secondsInterval: TimeInterval) -> String {
    let secondsIntervalAbs: TimeInterval = abs(secondsInterval)

    let hours = Int(secondsIntervalAbs) / 3600
    let minutes = Int(secondsIntervalAbs) % 3600 / 60
    let seconds = Int(secondsIntervalAbs) % 60
    let isNegative = Bool(secondsInterval < 0)

    var res: String = isNegative ? "-" : ""

    if hours > 0 {
        res += "\(hours)h \(minutes)m \(seconds)s"
    } else if minutes > 0 {
        res += "\(minutes)m \(seconds)s"
    } else {
        res += "\(seconds)s"
    }

    return res
}
