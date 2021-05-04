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
    let contactLocation: String
    
    init(contactLocation: String) {
        self.contactLocation = contactLocation
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
        mapView.mapView.delegate = self
        view.backgroundColor = .systemBackground
        //convertPlaceNameToCoordinate(contactLocation)
        //loadMapView()
        showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D(latitude: 40.74296, longitude: -73.94411), destinationCoordinate: CLLocationCoordinate2D(latitude: 40.829659, longitude: -73.926186))
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.829659, longitude: -73.926186), latitudinalMeters: 1600, longitudinalMeters: 1600)
        self.mapView.mapView.setRegion(region, animated: true)
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
                self.mapView.mapView.setVisibleMapRect(mapView.mapView.visibleMapRect.union(route.polyline.boundingMapRect), edgePadding: UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8), animated: true)
            }
            
        }
    }
    
    private func makeAnnotations() -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        locationSession.convertPlaceNameToCoordinates(addressString: contactLocation) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let coordinate):
                annotation.coordinate = coordinate
            }
        }
        //annotation.title = "Place"
        return annotation
    }
    
    private func loadMapView() {
        let annotation = makeAnnotations()
        mapView.mapView.addAnnotation(annotation)
        //mapview.showAnnotations
    }
    
    private func convertPlaceNameToCoordinate(_ placeName: String) {
        locationSession.convertPlaceNameToCoordinates(addressString: placeName) { (result) in
            switch result {
            case .failure(let error):
                print("geo coding error: \(error)")
            case .success(let coordinate):
                print("coordinate: \(coordinate)")
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
                self.mapView.mapView.setRegion(region, animated: true)
            }
        }
    }

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("did select")
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard annotation is MKPointAnnotation else {
//            return nil
//        }
//
//        let identifier = "locAnnotation"
//        var annotationView: MKPinAnnotationView
//
//        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
//            annotationView = dequeueView
//        } else {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView.canShowCallout = true
//        }
//
//        return annotationView
//    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("callout")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = .systemGreen
        renderer.lineWidth = 10.0
        return renderer
    }
    
    
}
