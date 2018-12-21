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

    var hotelList: [ListOfAvailableHotels]?
   // var availableHotelsList: [ListOfAvailableHotels]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        placesScreenOn()
    }

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        navigationController?.hidesBarsOnSwipe = false
    }

    func setupMap(){

        
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
        if let gethotelList = hotelList{

            for index in gethotelList{
                if let markerLat = index.hotelLat, let markerLang = index.hotelLang{
                    let marker = GMSMarker()
                    let markerView = UIImageView(image: #imageLiteral(resourceName: "marker").withRenderingMode(.alwaysTemplate))
                    //changing the tint color of the image
                    markerView.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
                    marker.iconView = markerView
                    marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(markerLat)! , longitude: CLLocationDegrees(markerLang)!)
                    marker.map = mapView


                }
            }

        }
        // let markers = [GMSMarker()]
        
    }

    
    func placesScreenOn(){
        placesCollectionView.hotelList = hotelList

        placesCollectionView.parentInstance = self
        view.addSubview(placesCollectionView)
        placesCollectionView.anchorToTop(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        placesCollectionView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT + 64).isActive = true
    }
    

    let mapView: GMSMapView = {
        let camera = GMSCameraPosition.camera(withLatitude: 51.527669000000003, longitude: -0.089038999999999993, zoom: 17)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        return mapView
    }()

    let placesCollectionView: SelectedHotelCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.headerReferenceSize = CGSize(width: 32, height: 0)
        layout.footerReferenceSize   = CGSize(width: 32, height: 0)
        let placesScreen = SelectedHotelCollectionView(frame: .zero, collectionViewLayout: layout)
        placesScreen.translatesAutoresizingMaskIntoConstraints = false
        return placesScreen
    }()
    
    
}
