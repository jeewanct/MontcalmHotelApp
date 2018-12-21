//
//  FloatingViewCells.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 16/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import WebKit


class BookNowInformationCell: UITableViewCell {

    var gradientLayer: CAGradientLayer!
    var heightConstraintParagraphView: NSLayoutConstraint?
    var parentInstance: FloatingBookView?
    let hotelDetailsView = HotelDetailsView()

    var hotelDetailData: HotelDetailModel?{
        didSet{
            if let knowMoreDetail =  hotelDetailData?.hotelFacilities{
               webView.loadHTMLString(knowMoreDetail, baseURL: nil)
            }

            let indexPathForFirstRow = IndexPath(row: 0, section: 0)
            self.hotelFacilities.selectItem(at: indexPathForFirstRow, animated: true, scrollPosition: .top)

            paragraph.text = hotelDetailData?.desc
            hotelDetailsView.hotelName.text = hotelDetailData?.hotelName
            hotelDetailsView.locationButton.setTitle(hotelDetailData?.hotelAddress, for: .normal)
            if let hotelImage = hotelDetailData?.gallery{
                if hotelImage.count > 0{
                    if let hotelImageName = hotelImage[0].imageUrl , let imageUrlRequest = URL(string: hotelImageName){
                        hotelDetailsView.hotelImage.pin_updateWithProgress = true
                        hotelDetailsView.hotelImage.pin_setImage(from: imageUrlRequest)

                    }
                }
            }
        }
    }



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

            addSubview(hotelDetailsView)
            hotelDetailsView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
            hotelDetailsView.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true


            let titleView = CardView()
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
            hotelFacilities.heightAnchor.constraint(equalToConstant: 50).isActive = true


        let cardView = BlackView()
        cardView.backgroundColor = .white
        addSubview(cardView)

        cardView.anchorWithConstantsToTop(top: hotelFacilities.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        cardView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.35).isActive = true


        addSubview(webView)

        webView.anchorWithConstantsToTop(top: hotelFacilities.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 16, rightConstant: 32)
        webView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.35).isActive = true





            addSubview(roomTypesButton)
            roomTypesButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06).isActive = true
            roomTypesButton.anchorWithConstantsToTop(top: webView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
        }

        @objc func handleReadMore(){


            if readMoreButton.title(for: .normal) == "READ MORE"{


                if let paragraphText = hotelDetailData?.desc {
                    let size = CGSize(width: UIScreen.main.bounds.width - 64 , height: 1000.0)
                    let estimatedFrame = NSString(string: paragraphText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "LATO-REGULAR", size: 13) ], context: nil)
                    parentInstance?.contentTableView.beginUpdates()
                    heightConstraintParagraphView?.constant = estimatedFrame.height + UIScreen.main.bounds.height * 0.3 * 0.2  + 68
                    readMoreButton.setTitle("READ LESS", for: .normal)
                    parentInstance?.contentTableView.endUpdates()


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
            lbl.font = UIFont(name: "LATO-REGULAR", size: 13)
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
            cv.backgroundColor  = .white
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

        let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()




    }


    class FacilityCell: UICollectionViewCell {



        override var isSelected: Bool{
            didSet{
                movingView.backgroundColor = isSelected ? #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1) : .white
            }
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            addViews()

            backgroundColor = .white
        }



        func addViews(){

            addSubview(facilityLabel)
            facilityLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)

            addSubview(movingView)
            movingView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
            movingView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true

        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        let facilityLabel: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textColor = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
            lbl.adjustsFontSizeToFitWidth = true
            lbl.numberOfLines = 1
            lbl.textAlignment = .center
            lbl.text = "Room Ammenities"
            lbl.font = UIFont.boldSystemFont(ofSize: 15)
            return lbl
        }()



        let movingView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            return view
        }()


    }


    class BookNowHotelListingCell: UITableViewCell{


        var roomList: HotelRoomsModel? {
            didSet{
                roomNameLabel.text = roomList?.roomName

                if let imageUrl = roomList?.roomImageUrl, let imageUrlRequest = URL(string: imageUrl){
                    roomImage.pin_updateWithProgress = true
                    roomImage.pin_setImage(from: imageUrlRequest)
                }
            }
        }



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

            addSubview(roomImage)
            roomImage.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16)
            roomImage.heightAnchor.constraint(equalToConstant: Constants.StandardSize.TABLEROWHEIGHT).isActive = true

            let blackView = BlackView()
            roomImage.addSubview(blackView)
            blackView.anchorToTop(top: roomImage.topAnchor, left: roomImage.leftAnchor, bottom: roomImage.bottomAnchor, right: roomImage.rightAnchor)


            addSubview(roomNameLabel)
            roomNameLabel.anchorWithConstantsToTop(top: roomImage.topAnchor, left: roomImage.leftAnchor, bottom: nil, right: roomImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)



            addSubview(startFromLabel)
            startFromLabel.anchorWithConstantsToTop(top: roomNameLabel.bottomAnchor, left: roomImage.leftAnchor, bottom: nil, right: roomImage.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)




        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }





        let roomImage: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.image = #imageLiteral(resourceName: "tempHotel")
            return iv
        }()

        let startFromLabel: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "Starts from £2000"
            lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            lbl.font = UIFont.boldSystemFont(ofSize: 13)
            return lbl
        }()

        let roomNameLabel: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textColor = .white
            //        lbl.adjustsFontSizeToFitWidth = true
            //        lbl.minimumScaleFactor = 0.1
            lbl.text = "The Montcalm London Marble Arch"
            lbl.font = UIFont.boldSystemFont(ofSize: 15)
            lbl.numberOfLines = 0
            return lbl
        }()
}
