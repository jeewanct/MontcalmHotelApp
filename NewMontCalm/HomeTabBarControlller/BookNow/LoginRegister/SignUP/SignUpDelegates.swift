//
//  SignUpDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 12/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension SignUpController{

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = PersonalHeader()
        headerView.titleLabel.text = ["Personal Information", "Address", "Contact Information", "Additional Information"][section]
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.main.bounds.height * 0.2
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
        return UIScreen.main.bounds.height * 0.07 * 5
        }else if indexPath.section == 3{
            return UIScreen.main.bounds.height * 0.07 * 5
        }
        return UIScreen.main.bounds.height * 0.07 * 6
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalDetailsCell", for: indexPath) as! PersonalDetailsCell
        cell.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        cell.selectionStyle = .none
        return cell
        }else if indexPath.section == 1{

        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressDetails", for: indexPath) as! AddressDetails
        cell.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        cell.selectionStyle = .none
        return cell

        }else if indexPath.section == 2{


        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactInformationCell", for: indexPath) as! ContactInformationCell
        cell.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        cell.selectionStyle = .none
        return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "AdditionalInformationCell", for: indexPath) as! AdditionalInformationCell
        cell.backgroundColor = Constants.Appearance.BACKGROUNDCOLOR
        cell.selectionStyle = .none
        return cell

    }


}








extension UITextField{

    func addBorder(textField: UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true

    }



}

extension UIButton{

    func addBorder(textField: UIButton){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true

    }
}


extension  AdditionalInformationCell{

    @objc func handleSubmit(){

        

    }
}
