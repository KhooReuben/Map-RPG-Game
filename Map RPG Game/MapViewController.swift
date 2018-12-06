import MapKit
import Foundation
import CoreLocation
import Firebase

class MapViewController : UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let territoryManager = TerritoryManager()
    let locationManager = CLLocationManager()
//    let targetLocationManager = TargetLocationManager()
    var endCoordinate = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = .follow
        locationManager.requestAlwaysAuthorization()
//        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        for location in territoryManager.locations {
            locationManager.startMonitoring(for: location.region)
            mapView.addAnnotation(location)
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //opens up territory for capture
    }
}
