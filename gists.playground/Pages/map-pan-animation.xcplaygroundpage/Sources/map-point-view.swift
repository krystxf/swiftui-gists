import MapKit
import SwiftUI

public struct MapPointView: UIViewControllerRepresentable {
    public var location: CLLocation
    public var distance: Double
    public var pitch: Double
    public var heading: Double = 0

    public class Controller: UIViewController {
        public var mapView: MKMapView {
            guard let tempView = view as? MKMapView else {
                fatalError("View could not be cast as MapView.")
            }
            tempView.mapType = .satelliteFlyover
            return tempView
        }

        override public func loadView() {
            let mapView = MKMapView()
            view = mapView

            let configuration = MKStandardMapConfiguration(elevationStyle: .realistic, emphasisStyle: .default)
            configuration.pointOfInterestFilter = .some(MKPointOfInterestFilter(including: [.publicTransport]))
            configuration.showsTraffic = false

            mapView.preferredConfiguration = configuration
            mapView.isZoomEnabled = false
            mapView.isPitchEnabled = false
            mapView.isScrollEnabled = false
            mapView.isRotateEnabled = false
            mapView.showsCompass = false
        }
    }

    public func makeUIViewController(context _: Context) -> Controller {
        Controller()
    }

    public func updateUIViewController(_ controller: Controller, context _: Context) {
        update(controller: controller)
    }

    public func update(controller: Controller) {
        controller.mapView.camera = MKMapCamera(
            lookingAtCenter: location.coordinate,
            fromDistance: distance,
            pitch: pitch,
            heading: heading
        )
    }
}
