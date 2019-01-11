//
//  MapFix.swift
//  Map RPG Game
//
//  Created by Reuben Khoo (s5065758) on 18/12/2018.
//  Copyright © 2018 Reuben Khoo (s5065758). All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import Firebase


class MapFix: UIViewController, CLLocationManagerDelegate   {
    
//    var teamGraphic: [UIImage] = [
//        UIImage(named: "redGraphic")!,
//        UIImage(named: "blueGraphic")!,
//        UIImage(named: "greenGraphic")!
//    ]
    
    var ref: DatabaseReference!
    var attackTerritory: Territory!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var TerritoryIdentifier: UILabel!
    
    let territoryManager = TerritoryManager()
    let locationManager = CLLocationManager()
    var endCoordinate = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mapView.setCenter(CLLocationCoordinate2DMake(...), animated: true)
        
        mapView.userTrackingMode = .follow
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        //makes it so the app gives a requestto use the user's location before using it directly
        // gives updates on the user's location
        
        for location in territoryManager.locations {
            locationManager.startMonitoring(for: location.region)
            mapView.addAnnotation(location)
            TerritoryIdentifier.text = "\(location.title ?? "--")" //default value = "--"
        }
    }
   
   
    
    // this code should have something to do with reading data from the Firebase Database:
   
    
   // ref = Database.database().reference()
    
//    let userID = Auth.auth().currentUser?.uid
// //   ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//    // Get user value
////    let value = snapshot.value as? NSDictionary
//    let username = value?["username"] as? String ?? ""
//    let user = User(username: username)
//
//    // ...
//    }) { (error) in
//    print(error.localizedDescription)
//    }

    
    
}

extension MapFix: MKMapViewDelegate {
    
   
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
        view.markerTintColor = annotation.color
        return view
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameViewController = storyboard.instantiateViewController(withIdentifier: "Game") as! GameViewController
        gameViewController.delegate = self
        gameViewController.territory = view.annotation as! Territory
        present(gameViewController, animated: true, completion: nil)
    }
    
    
    
}

extension MapFix: GameViewControllerDelegate {
    
    func didFinishGame(success: Bool, territory: Territory) {
        mapView.removeAnnotation(territory)
        mapView.addAnnotation(territory)
        print("did claim \(territory.title!)")
    
    }

}



//
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        guard let quote = view.annotation as? Territory else {return}
//        print(quote.title)
//        performSegue(withIdentifier: "Claim Territory", sender: quote)
//        //activates segue with the identifier from the current view controller's storyboard file - in this case the "info" button on the map view
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Claim Territory" {
//            do { let destination = segue.destination as! MapViewController
//                destination.attackTerritory = (sender as! Territory)
//                //this tells the segue to go to the second view controller
//            }
//        }
//    }
//


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     //when the segue happens
//     if segue.identifier == "Claim Territory" {
//         let destination = segue.destination as! GameViewController    //sends the information from the delegate
//     //     destination.delegate = self
//      }
//   }

//protocol SendDelegate {
//  func userSelectsLocation (data: GameViewController)     // sets the data sent accross to the delegate as a 'TargetLocation' group
//}
//
//
extension MapFix {
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        TerritoryIdentifier.text = "\(region.identifier)" + " is available for capture"
    }
  }

