import MapKit
import Foundation
import Firebase

class MapViewController : UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
//    let targetLocationManager = TargetLocationManager()
    var endCoordinate = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = .follow
        locationManager.requestAlwaysAuthorization()
//        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
//        for location in targetLocationManager.locations {
//            locationManager.startMonitoring(for: location.region)
//            mapView.addAnnotation(location)
//        }
    }
}

