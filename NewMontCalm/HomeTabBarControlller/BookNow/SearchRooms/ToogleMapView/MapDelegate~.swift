//
//  MapDelegate.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import GoogleMaps

extension RoomsMap: GMSMapViewDelegate{

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("marker Tapped",marker.layer.bounds.origin.x, marker.layer.bounds.origin.y)
        if placesScreen == nil{
        placesScreenOn()
        }
        return true
    }

    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {

    }


    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        placesScreenOff()
    }
}
