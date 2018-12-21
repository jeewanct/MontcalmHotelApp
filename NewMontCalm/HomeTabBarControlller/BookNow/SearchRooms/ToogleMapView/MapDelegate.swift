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
        return true
    }

    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
    }

    func handleMapAdjustment(hotelValue: Int){
        if hotelValue < hotelList?.count ?? 0 {
            if let gethotelList = hotelList?[hotelValue]{
                if let hotelLat = gethotelList.hotelLat, let hotelLang = gethotelList.hotelLang{
                    mapView.animate(toLocation: CLLocationCoordinate2D(latitude: CLLocationDegrees(hotelLat)!, longitude: CLLocationDegrees(hotelLang)!))
                }
            }
        }
    }

}
