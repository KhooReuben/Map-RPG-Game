import UIKit
import CoreLocation
import Foundation


class TerritoryManager {
    var locations = [Territory]()
    
    init() {
        let bournemouthUniCoordiante = CLLocationCoordinate2D(latitude: 50.742219, longitude: -1.896178)
        let bournemouthUniLocation = CLLocation(latitude: 50.742219, longitude: -1.896178)
        let bournemouthUniAnnotation = Territory(coordinate: bournemouthUniCoordiante, title: "BournemouthUni", center: bournemouthUniLocation)
        locations.append(bournemouthUniAnnotation)
        
        let pierCoordinate = CLLocationCoordinate2D(latitude: 50.715272, longitude: -1.875261)
        let pierLocation = CLLocation(latitude: 50.715272, longitude: -1.875261)
        let pierAnnotation = Territory(coordinate: pierCoordinate, title: "Pier", center: pierLocation)
        locations.append(pierAnnotation)
        
        let stationCoordinate = CLLocationCoordinate2D(latitude: 50.7270232, longitude: -1.863535)
        let stationLocation = CLLocation(latitude: 50.7270232, longitude: -1.863535)
        let stationAnnotation = Territory(coordinate: stationCoordinate, title: "Station", center: stationLocation)
        locations.append(stationAnnotation)
    }
}
