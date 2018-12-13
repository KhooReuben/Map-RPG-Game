import MapKit
import Foundation
import CoreLocation
import Firebase

class MapViewController : UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var TerritoryIdentifier: UILabel!
    
    let territoryManager = TerritoryManager()
    let locationManager = CLLocationManager()
    var endCoordinate = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = .follow
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        for location in territoryManager.locations {
            locationManager.startMonitoring(for: location.region)
            mapView.addAnnotation(location)
            TerritoryIdentifier.text = "\(location.title ?? "--")" //default value = "--"
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     //when the segue happens
//        if segue.identifier == "Claim Territory" {
//            let destination = segue.destination as! GameViewController    //sends the information from the delegate
//            destination.delegate = self
//        }
//    }
}

//protocol SendDelegate {
//    func userSelectsLocation (data: GameViewController)     // sets the data sent accross to the delegate as a 'TargetLocation' group
//}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //opens up territory for capture
    }
}
