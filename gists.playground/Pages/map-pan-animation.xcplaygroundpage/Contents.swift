//: ## Map pan around point animation
//: [Previous](@previous)

import MapKit
import PlaygroundSupport


PlaygroundPage
    .current
    .setLiveView(
        MapPointAnimatedView(
            centerPoint: CLLocationCoordinate2D(
                latitude: 41.4035971971512,
                longitude: 2.174441009360248
            ),
            distance: 600,
            pitch: 60,
            speed: 2
        ).frame(
            width: 1000.0,
            height: 1000.0
        )
    )
