//
//  FloatingViewCells.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 16/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


class BookNowInformationCell: UITableViewCell {

    var gradientLayer: CAGradientLayer!
    var heightConstraintParagraphView: NSLayoutConstraint?
    var parentInstance: FloatingBookView?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        backgroundColor = Constants.Appearance.BACKGROUNDCOLOR

    }

    override func draw(_ rect: CGRect) {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = paragraph.bounds
        gradientLayer.locations = [0.5, 1]
        gradientLayer.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2778253425).cgColor, #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1).cgColor]
        paragraph.layer.addSublayer(gradientLayer)
    }

    func addViews(){
        let hotelDetailsView = HotelDetailsView()
        addSubview(hotelDetailsView)
        hotelDetailsView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        hotelDetailsView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true


        let titleView = UIView()
        titleView.backgroundColor = .white
        titleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleView)
        titleView.anchorWithConstantsToTop(top: hotelDetailsView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        heightConstraintParagraphView = titleView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3)
        heightConstraintParagraphView?.isActive = true




        titleView.addSubview(paragraphTitle)
        paragraphTitle.anchorWithConstantsToTop(top: titleView.topAnchor, left: titleView.leftAnchor, bottom: nil, right: titleView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        paragraphTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true


        titleView.addSubview(paragraph)
        paragraph.anchorWithConstantsToTop(top: paragraphTitle.bottomAnchor, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor, topConstant: 2, leftConstant: 16, bottomConstant: UIScreen.main.bounds.height * 0.3 * 0.2 + 16, rightConstant: 16)

        titleView.addSubview(readMoreButton)
        readMoreButton.anchorToTop(top: nil, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor)
        readMoreButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3 * 0.2).isActive = true



        addSubview(hotelFacilities)
        hotelFacilities.anchorWithConstantsToTop(top: titleView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        hotelFacilities.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06).isActive = true


        addSubview(roomTypesButton)
        roomTypesButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06).isActive = true
        roomTypesButton.anchorWithConstantsToTop(top: hotelFacilities.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
    }

    @objc func handleReadMore(){

        if readMoreButton.title(for: .normal) == "READ MORE"{
        if let paragraphText = paragraph.text {


            let size = CGSize(width: UIScreen.main.bounds.width - 64 , height: 1000.0)
            let estimatedFrame = NSString(string: paragraphText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "LATO-REGULAR", size: 15) ], context: nil)
            parentInstance?.contentTableView.beginUpdates()
            heightConstraintParagraphView?.constant = estimatedFrame.height + UIScreen.main.bounds.height * 0.3 * 0.2  + 68
            readMoreButton.setTitle("READ LESS", for: .normal)
            parentInstance?.contentTableView.endUpdates()

            gradientLayer.removeFromSuperlayer()
        }
        }else{
           // paragraph.layer.addSublayer(gradientLayer)
            parentInstance?.contentTableView.beginUpdates()
            heightConstraintParagraphView?.constant = UIScreen.main.bounds.height * 0.3
            readMoreButton.setTitle("READ MORE", for: .normal)

            parentInstance?.contentTableView.endUpdates()


        }





       // let indexPath = IndexPath(row: 0, section: 0)
       // parentInstance?.contentTableView.reloadData()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    

//    lazy var imageCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.scrollDirection = .horizontal
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.isPagingEnabled = true
//        cv.delegate = self
//        cv.dataSource = self
//        cv.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "GalleryCollectionViewCell")
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        return cv
//    }()

    let paragraphTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Paragraph Title"
        lbl.textColor = Constants.Appearance.PRIMARYCOLOR
        return lbl
    }()

    let paragraph: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "The most notable changes in iOS 11 overall are back-end enhancements and an improved voice for Siri, plus Apple Pay and Photos services enhancements. The Do Not Disturb While Driving feature was introduced during the second beta. The ninth beta of iOS 11 has build number 15A5370a, with the previous holding number 15A5368a —a very small increment since Monday's update Paragraphs are commonly numbered using the decimal system, where (in books) the integral part of the decimal represents the number of the chapter and the fractional parts are arranged in each chapter in order of magnitude. Thus in Whittaker and Watson's 1921 A Course of Modern Analysis, chapter 9 is devoted to Fourier Series; within that chapter §9.6 introduces Riemann's theory, the following section §9.61 treats an associated function, following §9.62 some properties of that function, following §9.621 a related lemma, while §9.63 introduces Riemann's main theorem, and so on. Whittaker and Watson attribute this system of numbering to Giuseppe Peano on their  page, although this attribution does not seem to be widely credited elsewhere"
        lbl.font = UIFont(name: "LATO-REGULAR", size: 15)
        lbl.numberOfLines = 0
        return lbl
    }()

    lazy var readMoreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("READ MORE", for: .normal)
        btn.backgroundColor = Constants.Appearance.PRIMARYCOLOR
        btn.addTarget(self, action: #selector(handleReadMore), for: .touchUpInside)
        return btn
    }()

    lazy var hotelFacilities: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = false
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor  = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        cv.register(FacilityCell.self, forCellWithReuseIdentifier: "FacilityCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()


    let roomTypesButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitle("ROOM TYPES", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()


}


class FacilityCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }

   

    func addViews(){

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Appearance.SECONDARYCOLOR

        addSubview(view)
        view.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)

        view.addSubview(facilityLabel)
        facilityLabel.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let facilityLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.text = "Room Ammenities"

        return lbl
    }()




}


class BookNowHotelListingCell: UITableViewCell{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()
    }

    func addViews(){

        let cardView = CardView()
        addSubview(cardView)
        cardView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        cardView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true

        addSubview(backgroundImage)
        backgroundImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        backgroundImage.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true

        let blackView = BlackView()
        backgroundImage.addSubview(blackView)
        blackView.anchorToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: backgroundImage.rightAnchor)


        addSubview(imageHeading)
        imageHeading.anchorWithConstantsToTop(top: backgroundImage.topAnchor, left: backgroundImage.leftAnchor, bottom: nil, right: backgroundImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        


        addSubview(startFromLabel)
        startFromLabel.anchorWithConstantsToTop(top: nil, left: backgroundImage.leftAnchor, bottom: backgroundImage.bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
        startFromLabel.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true
        startFromLabel.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor, multiplier: 0.4).isActive = true

        addSubview(lastroomsLabel)
        lastroomsLabel.anchorWithConstantsToTop(top: nil, left: startFromLabel.rightAnchor, bottom: backgroundImage.bottomAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 16, rightConstant: 16)
        lastroomsLabel.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.1).isActive = true
        lastroomsLabel.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor, multiplier: 0.4).isActive = true

        addSubview(uberButton)
        uberButton.anchorWithConstantsToTop(top: nil, left: backgroundImage.leftAnchor, bottom: startFromLabel.topAnchor, right: backgroundImage.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        uberButton.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.12).isActive = true


        addSubview(callButton)
        callButton.anchorWithConstantsToTop(top: nil, left: backgroundImage.leftAnchor, bottom: uberButton.topAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        callButton.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.12).isActive = true
        callButton.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor, multiplier: 0.4).isActive = true

        addSubview(whatsAppButton)
        whatsAppButton.anchorWithConstantsToTop(top: nil, left: callButton.rightAnchor, bottom: uberButton.topAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 16)
        whatsAppButton.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.12).isActive = true
        whatsAppButton.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor, multiplier: 0.4).isActive = true


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "tempHotel")
        return iv
    }()

    lazy var uberButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Book an Uber", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        /// btn.imageEdgeInsets = UIEdgeInsets(top: 4, left: 20, bottom: 4, right: 20)
        // btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        //btn.backgroundColor = .white
        btn.contentHorizontalAlignment = .left
        btn.imageView?.contentMode = .scaleAspectFit
        return btn

    }()

    lazy var callButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("020 5482 5267", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        btn.imageView?.contentMode = .scaleAspectFit
        return btn

    }()


    lazy var whatsAppButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("07258454834", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        // btn.setImage(#imageLiteral(resourceName: "uber").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor =  #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        btn.contentHorizontalAlignment = .left
        //     btn.imageView?.contentMode = .
        return btn

    }()

    let startFromLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Starts from £2000"
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()

    let lastroomsLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Last 2 rooms left"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lbl
    }()

    let imageHeading: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        //        lbl.adjustsFontSizeToFitWidth = true
        //        lbl.minimumScaleFactor = 0.1
        lbl.text = "The Montcalm London Marble Arch"
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return lbl
    }()
}
