//
//  MapView.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 4/28/21.
//

import UIKit
import MapKit

class MapView: UIView {
       
    public lazy var mapView: MKMapView = {
        let mV = MKMapView()
        return mV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupMapViewConstraints()
    }
    
    
    private func setupMapViewConstraints() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
}
