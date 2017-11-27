//
//  SeeRoomInDetail.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class SeeRoomInDetail: UIViewController{
    var isButtonClicked = false
    var bookNowView =  UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setup()
         view = FloatingBookView ()



        let rightButtonBar = UIBarButtonItem(image: #imageLiteral(resourceName: "Floating").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleFloatingButton))
        navigationItem.rightBarButtonItem = rightButtonBar        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //addfloatingButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        floatingContentTableView.removeFromSuperview()
    }
    
    func setup(){
        title = "Book Now"
        view.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        SearchRooms.checkInLabel.setTitle("", for: .normal)
        SearchRooms.checkOutLabel.setTitle("", for: .normal)
        view.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        navigationController?.hidesBarsOnSwipe = false
    }

    @objc func handleFloatingButton(){
        //view = Restaurants()

        if let window = UIApplication.shared.keyWindow{
            window.addSubview(floatingContentTableView)


            if #available(iOS 11.0, *){
                floatingContentTableView.anchorWithConstantsToTop(top: window.topAnchor, left: nil, bottom: nil, right: window.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
            }else{
                floatingContentTableView.anchorWithConstantsToTop(top: topLayoutGuide.bottomAnchor, left: nil, bottom: nil, right: window.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
            }



            floatingContentTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.6).isActive = true
            floatingContentTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.2).isActive = true


            let cells = floatingContentTableView.visibleCells

            for cell in cells{
                cell.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
            }

            var delay = 0.0
            for cell in cells{


                UIView.animate(withDuration: delay, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: .transitionCurlDown, animations: {
                    cell.transform = .identity
                }, completion: nil)
                delay = delay + 0.2
            }
            
        }

    }


    lazy var floatingContentTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.register(FloatingCell.self, forCellReuseIdentifier: "FloatingCell")
        return tv
    }()


    let calendarButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        btn.setTitle("12/7/2017", for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Constants.Appearance.SECONDARYCOLOR
        return btn
    }()

    let searchButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("SEARCH", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        return btn
    }()

   
    

    
    
    
}
