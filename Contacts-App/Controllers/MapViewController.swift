//
//  MapViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 4/2/21.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    let mapView = MapView()
    
    private let locationSession = CoreLocationSession()
    private let geoCoder = CLGeocoder()
    private var isShowingAnnotations = false
    private var annotations = [MKPointAnnotation]()

    let contactLocation: String
    let userLocation: CLLocationCoordinate2D
    let contactFirstName: String
    
    init(contactLocation: String, contactFirstName: String) {
        self.contactLocation = contactLocation
        self.userLocation = locationSession.locationManager.location!.coordinate
        self.contactFirstName = contactFirstName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = mapView
    }
    
    let request = MKDirections.Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(contactLocation)
        print("user stuff")
        print(locationSession.locationManager.location?.coordinate.latitude ?? 0)
        
        convertPlaceNameToCoordinate(contactLocation)
        mapView.mapView.delegate = self
        view.backgroundColor = .systemBackground
        //convertPlaceNameToCoordinate(contactLocation)
        loadMapView()
    }
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile
        let directions = MKDirections(request: request)
        directions.calculate { [unowned self] (response, error) in
            guard let unwrappedResponse = response else {return}
            if let route = unwrappedResponse.routes.first {
                self.mapView.mapView.addOverlay(route.polyline)
                self.mapView.mapView.setVisibleMapRect(mapView.mapView.visibleMapRect.union(route.polyline.boundingMapRect), edgePadding: UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8), animated: false)
            }
            
        }
    }
    
    private func makeAnnotations() -> [MKPointAnnotation] {
        let contactAnnotation = MKPointAnnotation()
        let userAnnotation = MKPointAnnotation()
        
        locationSession.convertPlaceNameToCoordinates(addressString: contactLocation) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let coordinate):
                contactAnnotation.coordinate = coordinate
                contactAnnotation.title = self.contactFirstName
                print("first name: \(self.contactFirstName)")
                print("contact coordinate for annotes: \(coordinate.latitude)")
                let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), latitudinalMeters: 1600, longitudinalMeters: 1600)
                self.mapView.mapView.setRegion(region, animated: true)
            }
        }
        userAnnotation.coordinate = userLocation
        userAnnotation.title = "You"
        annotations.append(userAnnotation)
        annotations.append(contactAnnotation)
        isShowingAnnotations = true
        
        
        
        return annotations
    }
    
    private func loadMapView() {
        let annotations = makeAnnotations()
        mapView.mapView.addAnnotations(annotations)
        mapView.mapView.showAnnotations(annotations, animated: false)
    }
    
    private func convertPlaceNameToCoordinate(_ placeName: String) {
        locationSession.convertPlaceNameToCoordinates(addressString: placeName) { (result) in
            switch result {
            case .failure(let error):
                print("geo coding error: \(error)")
            case .success(let coordinate):
                print("coordinate converted from place name: \(coordinate)")
                self.showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D(latitude: self.userLocation.latitude, longitude: self.userLocation.longitude), destinationCoordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
                
                print("here: ")
                print(self.mapView.mapView.userLocation.coordinate)
                
            }
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = .systemGreen
        renderer.lineWidth = 3.0
        return renderer
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        if isShowingAnnotations   {
            mapView.showAnnotations(annotations, animated: false)
        }
        isShowingAnnotations = false
    }
    
}
