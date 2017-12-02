//
//  LoginRegisterDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 21/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit

extension LoginRegister{
    
    // Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginRegisterCell", for: indexPath) as! LoginRegisterCell
        cell.selectionStyle = .none
        cell.LoginRegisterInstance = self
        return cell
    }
}


extension LoginRegister{
    
    func setup(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(LoginRegisterCell.self, forCellReuseIdentifier: "LoginRegisterCell")
        tableView.contentInset = UIEdgeInsets(top: UIScreen.main.bounds.height * 0.32 , left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -(UIScreen.main.bounds.height * 0.32))
        
    }
    
    func updateHeaderView(){
        var headerRect = CGRect(x: 0, y: -(UIScreen.main.bounds.height * 0.32), width: tableView.bounds.width, height: UIScreen.main.bounds.height * 0.32 )
        if tableView.contentOffset.y < -(UIScreen.main.bounds.height * 0.32){
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    
    func handleLogin(email: String, password: String){

        navigationController?.pushViewController(MyAccount(), animated: true)
    }


    
}



extension LoginRegisterCell: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailText{
            passwordText.becomeFirstResponder()
        }else if textField == passwordText{
            passwordText.resignFirstResponder()
        }
        return true
    }




    @objc func handleSignUp(){

        LoginRegisterInstance?.present(UINavigationController(rootViewController: SignUpController()), animated: true, completion: nil)
    }


    @objc func handleLoginButton(){

        guard let email = emailText.text, let password = passwordText.text else {
            return
        }

        if email == "" || password == ""{
            CustomAlerts.shared.showAlert(alertTitle: "Warning", alertMessage: "Email or password Empty", actionTitle: "OK", controller: LoginRegisterInstance!)
        }else{

//            ApiService.shared.postMethod(url: Constants.CustomApis.HOMEURL + Constants.CustomApis.LOGIN, bodyParameter: ["":""], completion: { (data) in
//
//                DispatchQueue.main.async {
                    self.LoginRegisterInstance?.handleLogin(email: email, password: password)
//                }
//            })
        }

    }

}
