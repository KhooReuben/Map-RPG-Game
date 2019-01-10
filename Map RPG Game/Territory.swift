import MapKit
import Foundation

class Territory: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var center: CLLocation!
    var radius: Int?
    var region: CLCircularRegion
    var color = UIColor.green
    init(coordinate:CLLocationCoordinate2D, title: String, center: CLLocation){
        self.coordinate = coordinate
        self.title = title
        self.center = center
        region = CLCircularRegion(center: coordinate, radius: 50, identifier: title)
    }
}
