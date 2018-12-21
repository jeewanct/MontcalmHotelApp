//
//  PaymentDetailsController.swift
//  NewMontCalm
//
//  Created by JEEVAN TIWARI on 03/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

class PaymentDetailsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
       // tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        setup()
    }
    
    func setup(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(PaymentDetailsCell.self, forCellReuseIdentifier: "PaymentDetailsCell")
        tableView.register(PaymentPolicyCell.self, forCellReuseIdentifier: "PaymentPolicyCell")
        tableView.register(IAgreeView.self, forCellReuseIdentifier: "IAgreeView")
    }

}

extension PaymentDetailsController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = PaymentDetailsHeader()
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  UIScreen.main.bounds.height * 0.2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0{
        return UIScreen.main.bounds.height * 0.07 * 4 + 8
        }
        
        if indexPath.item == 4 || indexPath.item == 5{
                return UIScreen.main.bounds.height * 0.12
        }
        
        return UIScreen.main.bounds.height * 0.065
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentDetailsCell", for: indexPath) as! PaymentDetailsCell
            return cell
        }
        
        if indexPath.item == 4 || indexPath.item == 5{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "IAgreeView", for: indexPath) as! IAgreeView
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentPolicyCell", for: indexPath) as! PaymentPolicyCell
        return cell
        
    }
    
}

class PaymentDetailsHeader: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    func addView(){
        let cardView = CardView()
        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        
        cardView.addSubview(precautionLabel)
        precautionLabel.anchorWithConstantsToTop(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: nil, right: cardView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        precautionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.55).isActive = true
        
        cardView.addSubview(scanYourCardBtn)
        scanYourCardBtn.anchorWithConstantsToTop(top: precautionLabel.bottomAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let precautionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Payment Details\nPlease enter your information. *Indicates required field. *The credit card must be presented upon check-in."
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    let scanYourCardBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Scan your card", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1), for: .normal)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
}

class PaymentDetailsCell: UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = .clear
    }
    
    func addViews(){
        
        let cardDetailsView = BlackView()
        cardDetailsView.backgroundColor = .white
        addSubview(cardDetailsView)
        
        cardDetailsView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        
        cardDetailsView.addSubview(enterNameOnCardText)
        cardDetailsView.addSubview(inputCardText)
        cardDetailsView.addSubview(expiryText)
        cardDetailsView.addSubview(enterSecurityText)
        
        enterNameOnCardText.anchorWithConstantsToTop(top: topAnchor, left: cardDetailsView.leftAnchor, bottom: nil, right: cardDetailsView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        enterNameOnCardText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true
        
        inputCardText.anchorWithConstantsToTop(top: enterNameOnCardText.bottomAnchor, left: cardDetailsView.leftAnchor, bottom: nil, right: cardDetailsView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        inputCardText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true
        
        expiryText.anchorWithConstantsToTop(top: inputCardText.bottomAnchor, left: cardDetailsView.leftAnchor, bottom: nil, right: cardDetailsView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        expiryText.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07).isActive = true
        
        enterSecurityText.anchorWithConstantsToTop(top: expiryText.bottomAnchor, left: cardDetailsView.leftAnchor, bottom: bottomAnchor, right: cardDetailsView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        
    }
    
    override func draw(_ rect: CGRect) {
        enterNameOnCardText.addBorder(textField: enterNameOnCardText)
        inputCardText.addBorder(textField: inputCardText)
        expiryText.addBorder(textField: expiryText)
        enterSecurityText.addBorder(textField: enterSecurityText)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    let enterNameOnCardText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .left
        tf.backgroundColor = .white
        tf.placeholder = "Enter Name on Card"
        return tf
    }()
    
    let inputCardText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.placeholder = "Input Card Number"
        return tf
    }()
    
    let expiryText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.placeholder = "MM/YY"
        return tf
    }()
    
    let enterSecurityText: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.contentHorizontalAlignment = .right
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.placeholder = "Enter Security Code"
        return tf
    }()
}

class PaymentPolicyCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = .clear
    }
    
    func addViews(){
        let whiteView = BlackView()
        whiteView.backgroundColor = .white
        
        addSubview(whiteView)
        whiteView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 1, rightConstant: 16)
        
        whiteView.addSubview(privacyLabel)
        privacyLabel.anchorWithConstantsToTop(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        whiteView.addSubview(nextImage)
        nextImage.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor).isActive = true
        nextImage.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -16).isActive = true
       
        nextImage.heightAnchor.constraint(equalTo: whiteView.heightAnchor, multiplier: 0.4).isActive = true
        nextImage.widthAnchor.constraint(equalTo: whiteView.heightAnchor, multiplier: 0.4).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let privacyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Payment Policy"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    let nextImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysOriginal)
        return iv
    }()
}




class IAgreeView: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = .clear
    }
    
    func addViews(){
        let whiteView = BlackView()
        whiteView.backgroundColor = .white
        
        addSubview(whiteView)
        whiteView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 1, rightConstant: 16)
        
        whiteView.addSubview(acceptButton)
        whiteView.addSubview(aggrementLabel)
        
        acceptButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        acceptButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        acceptButton.centerYAnchor.constraint(equalTo: aggrementLabel.centerYAnchor).isActive = true
        acceptButton.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 16).isActive = true
        
        
        aggrementLabel.anchorWithConstantsToTop(top: whiteView.topAnchor, left: acceptButton.rightAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let aggrementLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "I agree with The Montcalm Luxury Hotels general terms & conditions by make the reservation"
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    let acceptButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderColor = Constants.Appearance.PRIMARYCOLOR.cgColor
        btn.layer.borderWidth = (UIScreen.main.bounds.width - 32) * 0.01
        return btn
    }()
    
    
}








