//
//  MapViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 4/2/21.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController {
    
    let mapView = MapView()
    
    private let locationSession = CoreLocationSession()
    private let geoCoder = CLGeocoder()
    
    override func loadView() {
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        convertCoordinateToPlacemark()
        convertPlaceNameToCoordinate()
        
        mapView.mapView.showsUserLocation = true
    }
    
    private func convertCoordinateToPlacemark() {
        locationSession.convertCoordinatesToPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.74296, longitude: -73.94411))
    }
    
    private func convertPlaceNameToCoordinate() {
        locationSession.convertPlaceNameToCoordinates(addressString: "miami")
    }

}
