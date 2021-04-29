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
    
    override func loadView() {
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        convertPlaceNameToCoordinate("2701 grand concourse 6b bronx ny 10468")
        
        //mapView.mapView.showsUserLocation = true
        mapView.mapView.delegate = self
        loadMapView()
    }
    
    private func makeAnnotations() -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        locationSession.convertPlaceNameToCoordinates(addressString: "2701 grand concourse 6b bronx ny 10468") { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let coordinate):
                annotation.coordinate = coordinate
            }
        }
//        return convertPlaceNameToCoordinate("2701 grand concourse 6b bronx ny 10468")
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 40.74296, longitude: -73.94411)
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
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1600, longitudinalMeters: 1600)
                self.mapView.mapView.setRegion(region, animated: true)
            }
        }
    }

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("did select")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else {
            return nil
        }
        
        let identifier = "locAnnotation"
        var annotationView: MKPinAnnotationView
        
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            annotationView = dequeueView
        } else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.canShowCallout = true
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("callout")
    }
    
    
}
