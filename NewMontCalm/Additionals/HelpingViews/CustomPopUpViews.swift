//
//  CustomPopUpViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 27/11/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import WebKit

class CustomPopUpViews: UIView{

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0/255,green: 0/255,blue: 0/255, alpha:0.6)
        addViews()
    }

    override func draw(_ rect: CGRect) {
        whiteView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
            self.whiteView.transform = .identity
        }, completion: nil)
    }

    func addViews(){
        addSubview(whiteView)
        whiteView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        whiteView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        whiteView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        whiteView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true

        whiteView.addSubview(webView)
        webView.anchorWithConstantsToTop(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        
        addSubview(closeButton)
        closeButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        closeButton.topAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: 16).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }

    @objc func handleClose(){

        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
            self.whiteView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        }, completion: { (value) in
            self.removeFromSuperview()
        })

    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    let webView: WKWebView = {
        let webView = WKWebView()
        webView.contentScaleFactor = 200.0
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    lazy var closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        btn.setImage(#imageLiteral(resourceName: "popUpClose").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        return btn
    }()
}


