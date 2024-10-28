import MapKit
import SwiftUI

public struct MapPointAnimatedView: View {
    private let centerPoint: CLLocationCoordinate2D
    private var distance: Double
    private var pitch: Double
    private var speed: Double

    public init(
        centerPoint: CLLocationCoordinate2D,
        distance: Double,
        pitch: Double,
        speed: Double
    ) {
        self.centerPoint = centerPoint
        self.distance = distance
        self.pitch = pitch
        self.speed = speed
    }

    public var body: some View {
        TimelineView(.animation) {
            MapPointView(
                location: CLLocation(
                    latitude: centerPoint.latitude,
                    longitude: centerPoint.longitude
                ),
                distance: distance,
                pitch: pitch,
                heading: $0.date.timeIntervalSince1970 * speed
            )
        }
    }
}
