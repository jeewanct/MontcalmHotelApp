//
//  Extensions.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit


//MARK: Constraints


extension UIView{
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,right: NSLayoutXAxisAnchor? = nil) {
        
        anchorWithConstantsToTop(top: top, left:left, bottom:  bottom, right: right, topConstant:  0 , leftConstant:  0 , bottomConstant:  0 , rightConstant:  0 )
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0 , leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0,rightConstant: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}


extension UIView{

    func staticLabels(title: String, title2: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.attributedText = lbl.convertAttributeString(firstString: title, secondString: title2, firstColor: .black, secondColor: Constants.Appearance.PRIMARYCOLOR)
        lbl.font =  UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }

    func staticLabelsWithTextColor(title: String, textColor: UIColor) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.1
        lbl.textColor = textColor
        lbl.text = title
        lbl.font =  UIFont.boldSystemFont(ofSize: 15)
        lbl.numberOfLines = 0
        return lbl
    }

}

extension UILabel{






    func convertAttributeString(firstString: String, secondString: String, firstColor: UIColor, secondColor: UIColor) -> NSMutableAttributedString{
        let convertedString =  NSMutableAttributedString(string: firstString, attributes: [NSAttributedStringKey.foregroundColor:firstColor] )
        convertedString.append(NSMutableAttributedString(string: secondString, attributes: [NSAttributedStringKey.foregroundColor: secondColor]))
        return convertedString
    }


    func convertAttributeStringWithUnderLine(firstString: String, secondString: String) -> NSMutableAttributedString{
        let convertedString =  NSMutableAttributedString(string: firstString, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)] )
        convertedString.append(NSMutableAttributedString(string: secondString, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1) , NSAttributedStringKey.underlineColor : #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1) , NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue ]))
        return convertedString
    }

    func buttonIcons(image: UIImage) -> UIImageView{
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.image = image.withRenderingMode(.alwaysTemplate)
        iv.tintColor = #colorLiteral(red: 0.6705882353, green: 0.5607843137, blue: 0.3333333333, alpha: 1)
        iv.contentMode = .scaleAspectFit
        return iv
    }
    
}

