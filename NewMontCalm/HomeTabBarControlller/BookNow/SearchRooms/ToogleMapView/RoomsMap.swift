//
//  RoomsMap.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import GoogleMaps

class RoomsMap: UIViewController{
    var placesScreen: SelectedHotelCollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setup()
    }
    
    func setup(){
        
    }
    
    func setupMap(){
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 15)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        
        // Importing google map style from json
        do{
            guard let stylePath = Bundle.main.url(forResource: "CustomMap", withExtension: "json") else { return }
            mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: stylePath)
            
        }catch let styleLoadError{
            print(styleLoadError.localizedDescription)
        }
        mapView.delegate = self
        self.view = mapView
        
        // Adding Marker on map
        // let markers = [GMSMarker()]
        let marker = GMSMarker()
        marker.icon = #imageLiteral(resourceName: "marker").withRenderingMode(.alwaysTemplate)
        marker.iconView?.tintColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.map = mapView
        
    }
    
    func placesScreenOn(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.headerReferenceSize = CGSize(width: 32, height: 0)
        layout.footerReferenceSize   = CGSize(width: 32, height: 0)
        placesScreen = SelectedHotelCollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(placesScreen!)
        placesScreen?.anchorToTop(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        placesScreen?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        placesScreen?.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height * 0.3)
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseIn, animations: {
            self.placesScreen?.transform = .identity
        }, completion: nil)
        
    }
    
    func placesScreenOff(){
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseIn, animations: {
            self.placesScreen?.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height * 0.3)
        }, completion: {_ in
            self.placesScreen?.removeFromSuperview()
            self.placesScreen = nil
        })
        
        
    }
    
    
}
