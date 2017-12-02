//
//  CustomPopUpViews.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 27/11/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

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
        whiteView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true


        whiteView.addSubview(closeButton)
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 8).isActive = true
        closeButton.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -8).isActive = true

        whiteView.addSubview(contentTableView)
        contentTableView.anchorWithConstantsToTop(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 16, rightConstant: 0)
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

    lazy var contentTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(CustomViewContentCell.self, forCellReuseIdentifier: "CustomViewContentCell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.estimatedRowHeight = 100
        tv.separatorStyle = .none
        tv.rowHeight = UITableViewAutomaticDimension
        return tv
    }()

    lazy var closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        btn.setImage(#imageLiteral(resourceName: "popUpClose").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        return btn
    }()
}


extension CustomPopUpViews: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewContentCell", for: indexPath) as! CustomViewContentCell
        cell.selectionStyle = .none
        return cell
    }
}

class CustomViewContentCell: UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()

    }

    func addViews(){

        addSubview(contentHeading)
        contentHeading.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)


        addSubview(contentLabel)
        contentLabel.anchorWithConstantsToTop(top: contentHeading.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let contentHeading: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Privacy And Cookies Policy"
        lbl.textColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        lbl.font = UIFont(name: lbl.font.fontName, size: 17)
        return lbl
    }()

    let contentLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: lbl.font.fontName, size: 14)
        lbl.numberOfLines = 0
        lbl.text = "kljlkjdkljgkldjslkfjdlskjfkldjsklj lkjdklsjflkjsl;kfjlskdjfklsdjflkjsdlkfjlksdjflksdjflkjslkfjlksjfkljfjklsdfjkldjsfkldjsgjdfsklgjkldsjgkljdsfklgjdlskfjgkldsfjgkldjsfklgjdfklgjdsklfjgkldsfjgkldsfjgkldfjklgjdklsfjgkldfsjgkldfjgkldfjgkldsfjgkljdfklgjdfklgjdfkljgkldfjgkldfjgkldfjklgjdfklgjsdklf;sjglk;dsjfglk;jdsfl;kgjsdl;kgjlkdfs;jgklds;fjglkdfjsglk;jdfslgk;jdfskl;gjdfkls;gjkldfs;gjkl;dfsgjkl;gkl;dfjsgkldfjsgkljdfklgjdfklsgjdfklsgjkldfjgkldfjgkldfjklgjdfklsgjdfkljgkldfgjkldfjgkldfjgkldfjgkljdfklgjdfklgjdfklgjkldfjgkldfjgkljdfklgjdfklgjdfklgjkldfjgkldfjgkldfjgkljdfklsgjdflksgjkldsfjgkldsjfgkl;jdsfkl;gjdskl;gjkl;dsfjglk;dsjfgkl;jdfsklg;jdfklgjkldfjgkljdfgkljdfkljgkldfjgjfklgfdgdfgfdgfdgdfgfdgf"
        return lbl
    }()


}
