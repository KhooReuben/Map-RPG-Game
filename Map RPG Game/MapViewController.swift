import MapKit
import Foundation
import CoreLocation
import Firebase

class MapViewController : UIViewController {

     var attackTerritory: Territory!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var TerritoryIdentifier: UILabel!
    
    let territoryManager = TerritoryManager()
    let locationManager = CLLocationManager()
    var endCoordinate = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = .follow
        locationManager.requestAlwaysAuthorization()
  //     locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        locationManager.requestAlwaysAuthorization()
        //makes it so the app gives a requestto use the user's location before using it directly
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.startUpdatingLocation()
        // gives updates on the user's location
        
        for location in territoryManager.locations {
            locationManager.startMonitoring(for: location.region)
            mapView.addAnnotation(location)
            TerritoryIdentifier.text = "\(location.title ?? "--")" //default value = "--"
            
        }
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        
        guard let annotation = annotation as? Territory else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        return view
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let quote = view.annotation as? Territory else {return}
        print(quote.title)
        performSegue(withIdentifier: "Claim Territory", sender: quote)
        //activates segue with the identifier from the current view controller's storyboard file - in this case the "info" button on the map view
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Claim Territory" {
            do { let destination = segue.destination as! MapViewController
                destination.attackTerritory = (sender as! Territory)
                //this tells the segue to go to the second view controller
            }
        }
    }
    
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     //when the segue happens
//     if segue.identifier == "Claim Territory" {
//         let destination = segue.destination as! GameViewController    //sends the information from the delegate
//     //     destination.delegate = self
//      }
//   }
}

//protocol SendDelegate {
//  func userSelectsLocation (data: GameViewController)     // sets the data sent accross to the delegate as a 'TargetLocation' group
//}
//
//
//extension MapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
//        //opens up territory for capture
//    }
//  }

