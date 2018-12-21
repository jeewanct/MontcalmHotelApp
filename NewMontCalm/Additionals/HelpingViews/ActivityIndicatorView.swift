//
//  ActivityIndicatorView.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 05/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
    
    var cardViewHeight: NSLayoutConstraint?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addViews()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func draw(_ rect: CGRect) {
        cardViewHeight?.constant = 48 + activityIndicator.frame.height + loadingLabel.frame.height
        animateCardView()
    }
    
    func animateCardView(){
    
        cardView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        UIView.animate(withDuration: 0.9, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseIn, animations: {
            self.cardView.transform = .identity
        }, completion: nil)
    }
    
    func close(){
        
        UIView.animate(withDuration: 0.9, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseIn, animations: {
            self.cardView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        }, completion:{ (value) in
            self.activityIndicator.stopAnimating()
            self.removeFromSuperview()
        })
        
        
    }
    
    func addViews(){
       
       // cardView.backgroundColor = Constants.Appearance.SECONDARYCOLOR
        addSubview(cardView)
        cardView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cardViewHeight = cardView.heightAnchor.constraint(equalToConstant: 50)
        cardViewHeight?.isActive = true
        cardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35).isActive = true
        
        
        cardView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        
        cardView.addSubview(loadingLabel)
        loadingLabel.anchorWithConstantsToTop(top: nil, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView()
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.activityIndicatorViewStyle = .whiteLarge
        activityView.color = Constants.Appearance.PRIMARYCOLOR
        activityView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        return activityView
    }()
    
    let loadingLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.text = "Loading..."
        lbl.textAlignment = .center
        lbl.textColor = Constants.Appearance.SECONDARYCOLOR
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    let cardView: CardViewWithCorners = {
        let cv = CardViewWithCorners()
        return cv
    }()

    
    
    
}
