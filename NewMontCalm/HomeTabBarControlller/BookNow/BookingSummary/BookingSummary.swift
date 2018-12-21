//
//  ViewController.swift
//  Example
//
//  Created by JEEVAN TIWARI on 01/12/17.
//  Copyright © 2017 JEEVAN TIWARI. All rights reserved.
//

import UIKit


protocol openShareController {
    func shareController()
}

class BookingSummary: UIViewController {

    func shareController() {
        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor  = .white
        addViews()
        title = "Booking Summary"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func addViews(){
        
        
        view.addSubview(containerView)
        containerView.anchorToTop(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        containerView.heightAnchor.constraint(equalToConstant:49).isActive = true
        
        if #available(iOS 11.0, *){
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }else{
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
        
        containerView.addSubview(homeButton)
        homeButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        homeButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 32) / 2).isActive = true
        homeButton.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: 8).isActive = true
        
        containerView.addSubview(modifyBookingButton)
        modifyBookingButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        modifyBookingButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8).isActive = true
        modifyBookingButton.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -8).isActive = true
        modifyBookingButton.leftAnchor.constraint(equalTo: homeButton.rightAnchor,constant: 8).isActive = true
        
        
        
        view.addSubview(contentTable)
        if #available(iOS 11.0, *){
            contentTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        }else{
                contentTable.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            
        }
        contentTable.anchorToTop(top: nil , left: view.leftAnchor, bottom: containerView.topAnchor, right: view.rightAnchor)
        
    }

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()

    lazy var  contentTable: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.register(BookingSummaryCell.self, forCellReuseIdentifier: "BookingSummaryCell")
        tv.register(BookedRooms.self, forCellReuseIdentifier: "BookedRooms")
        tv.rowHeight = UITableViewAutomaticDimension
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let containerView: UIView = {
        let containerView = UIView()
         containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        return containerView
    }()
    
    
    let homeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("HOME", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        //  btn.addTarget(self, action: #selector(handleComparePrices), for: .touchUpInside)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.numberOfLines = 1
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }()
    
    let modifyBookingButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("MODIFY BOOKING", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.titleLabel?.font = UIFont(name: Constants.Fonts.FONTREGULAR, size: 17)
      //  btn.addTarget(self, action: #selector(handleReservation), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
}

extension BookingSummary: UITableViewDelegate, UITableViewDataSource{


    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 1
        }
        return  5

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }

        return UIScreen.main.bounds.height * 0.07
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return nil
        }
        
        let headerView = BookedRoomsHeaderView()
        return headerView

    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookingSummaryCell", for: indexPath) as! BookingSummaryCell
            cell.selectionStyle = .none
            cell.parentInstance = self
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "BookedRooms", for: indexPath) as! BookedRooms
        cell.selectionStyle = .none
        return cell


    }
    
}
class BookingSummaryCell: UITableViewCell,openShareController  {
    func shareController() {
        parentInstance?.shareController()
    }
    
    var parentInstance: BookingSummary?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
    }
    
    func addViews(){
        let successImageView = SuccessView()
        addSubview(successImageView)
        successImageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        successImageView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true
        
        let sharingView = SharingView()
        sharingView.delegate = self


        addSubview(sharingView)
        sharingView.anchorWithConstantsToTop(top: successImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        sharingView.heightAnchor.constraint(equalToConstant: 16 + 4 + 16 + UIScreen.main.bounds.height * 0.065 + 20).isActive = true
        
        let totalNightsView = BlackView()
        totalNightsView.backgroundColor = .white
        addSubview(totalNightsView)
        totalNightsView.anchorWithConstantsToTop(top: sharingView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        
        totalNightsView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true
        
        totalNightsView.addSubview(totalStayLabel)
        totalStayLabel.anchorWithConstantsToTop(top: totalNightsView.topAnchor, left: totalNightsView.leftAnchor, bottom: totalNightsView.bottomAnchor, right: totalNightsView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        
        let dateView = CheckInCheckOutView()
        addSubview(dateView)
        dateView.anchorWithConstantsToTop(top: totalNightsView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        dateView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT * 0.6).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let totalStayLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Check In & Check Out: 5 Nights"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
   
    
}


class BookedRooms: UITableViewCell{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
    }

    func addViews(){
        let whiteView = BlackView()
        whiteView.backgroundColor = .white

        addSubview(whiteView)
        whiteView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)

        whiteView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065 * 3).isActive = true


        whiteView.addSubview(roomTypeLabel)
        roomTypeLabel.anchorWithConstantsToTop(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        roomTypeLabel.widthAnchor.constraint(equalTo: whiteView.widthAnchor, multiplier: 0.6).isActive = true
        roomTypeLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true


        whiteView.addSubview(rateTypeLabel)
        rateTypeLabel.anchorWithConstantsToTop(top: roomTypeLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        roomTypeLabel.widthAnchor.constraint(equalTo: whiteView.widthAnchor, multiplier: 0.6).isActive = true
        roomTypeLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true

        whiteView.addSubview(numberofRoomsLabel)
        numberofRoomsLabel.anchorWithConstantsToTop(top: rateTypeLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        numberofRoomsLabel.widthAnchor.constraint(equalTo: whiteView.widthAnchor, multiplier: 0.6).isActive = true
        numberofRoomsLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true

        

//
//        whiteView.addSubview(totalCostLabel)
//        totalCostLabel.centerYAnchor.



    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let roomTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Club Double - Club Lounge"
        return lbl
    }()

    let rateTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Breakfast Included"
        return lbl
    }()

    let numberofRoomsLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Room 1"
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        return lbl
    }()

    let totalCostLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "$350.00"
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        return lbl
    }()
}

class SuccessView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
    }
    
    
    func addViews(){
        addSubview(successImage)
        successImage.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

        
        let blackView = BlackView()
        successImage.addSubview(blackView)
        blackView.anchorToTop(top: successImage.topAnchor, left: successImage.leftAnchor, bottom: successImage.bottomAnchor, right: successImage.rightAnchor)
        
        let centerView = BlackView()
        addSubview(centerView)
        centerView.backgroundColor = .clear
        centerView.centerXAnchor.constraint(equalTo: successImage.centerXAnchor).isActive = true
        centerView.centerYAnchor.constraint(equalTo: successImage.centerYAnchor).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        centerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(bookingIdLabel)
        bookingIdLabel.anchorToTop(top: centerView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        
        addSubview(emailIdLabel)
        emailIdLabel.anchorToTop(top: bookingIdLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        
        
        
        addSubview(likeImageView)
        likeImageView.centerXAnchor.constraint(equalTo: successImage.centerXAnchor).isActive = true
        likeImageView.bottomAnchor.constraint(equalTo: centerView.topAnchor, constant: -8).isActive = true
        likeImageView.heightAnchor.constraint(equalTo: successImage.heightAnchor, multiplier: 0.25).isActive = true
        likeImageView.widthAnchor.constraint(equalTo: successImage.heightAnchor, multiplier: 0.25).isActive = true
        
        
        let sharingView = BlackView()
        sharingView.backgroundColor = .white
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let successImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()
    
    let likeImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "like").withRenderingMode(.alwaysTemplate)
        iv.tintColor = .white
        return iv
    }()
    
    let bookingIdLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Booking ID: 832843"
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let emailIdLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Email ID: test@neotericuk.co.uk"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    
}


class SharingView: UIView {

    var delegate: openShareController?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
    }
    
    func addViews(){
        addSubview(hotelNameLabel)
        hotelNameLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        hotelNameLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065).isActive = true

        addSubview(callButton)
        callButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        callButton.topAnchor.constraint(equalTo: hotelNameLabel.bottomAnchor, constant: 4).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        callButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(messageButton)
        messageButton.leftAnchor.constraint(equalTo: callButton.rightAnchor, constant: 16).isActive = true
        messageButton.topAnchor.constraint(equalTo: hotelNameLabel.bottomAnchor, constant: 4).isActive = true
        messageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        messageButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(replyButton)
        replyButton.leftAnchor.constraint(equalTo: messageButton.rightAnchor, constant: 16).isActive = true
        replyButton.topAnchor.constraint(equalTo: hotelNameLabel.bottomAnchor, constant: 4).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(shareButton)
        shareButton.leftAnchor.constraint(equalTo: replyButton.rightAnchor, constant: 16).isActive = true
        shareButton.topAnchor.constraint(equalTo: hotelNameLabel.bottomAnchor, constant: 4).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 20).isActive = true


        
        
    }

    @objc func handleShare(){
        delegate?.shareController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let hotelNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "M By Montcalm Shoreditch London Tech City"
        lbl.textColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    let callButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "call").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        return btn
    }()
    
    let messageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "message").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        return btn
    }()

    
    let replyButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
    //    btn.imageView?.contentMode = .scaleAspectFill
    //    btn.imageView?.clipsToBounds = true
        return btn
    }()

    
    lazy var shareButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "share").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
   //     btn.imageView?.clipsToBounds = true
        btn.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
      //  btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()

}




class BookedRoomsHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
    }

    func addViews(){
        let whiteView = BlackView()
        whiteView.backgroundColor = .white

        addSubview(whiteView)

        whiteView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

        whiteView.addSubview(offerLabel)
        offerLabel.anchorWithConstantsToTop(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)

        let blackView = BlackView()
        whiteView.addSubview(blackView)
        blackView.anchorWithConstantsToTop(top: nil, left: whiteView.leftAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        blackView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let offerLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Rooms 15% off "
        return lbl
    }()
}




