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

        return loginCell
        
    }
}


extension LoginRegister{


    @objc func handleSignUp(){

        let obj = SignUpController()
        obj.screenType = ProfileValue.REGISTER
        obj.title = "Sign up"
        present(UINavigationController(rootViewController: obj), animated: true, completion: nil)
    }




    func setup(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: UIScreen.main.bounds.height * 0.32 , left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -(UIScreen.main.bounds.height * 0.32))
        loginCell.loginButton.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
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
    
    
    @objc func handleLogin(){

        UserDefaults.standard.set(true, forKey: "isLogin")
        navigationController?.pushViewController(MyAccount(), animated: true)
    }

    @objc func handleLoginButton(){

        guard let email = loginCell.emailText.text, let password = loginCell.passwordText.text else {
            return
        }

        if email == "" || password == ""{
            CustomAlerts.shared.showAlert(alertTitle: "Warning", alertMessage: "Email or password Empty", actionTitle: "OK", controller: self)
        }else{

            callApi()

        }

    }

    func callApi(){
        loginCell.activityIndicator.isHidden = false
        loginCell.activityIndicator.startAnimating()
        loginCell.loginButton.setTitle("", for: .normal)
        self.performSelector(inBackground: #selector(handleLoginUser), with: nil)

    }

    @objc func stopAnimation(){
        loginCell.activityIndicator.stopAnimating()
        loginCell.activityIndicator.isHidden = true
        loginCell.loginButton.setTitle("LOG IN", for: .normal)
    }

    @objc func handleShowAlert(){
        CustomAlerts.shared.showAlert(alertTitle: "sorry", alertMessage: "sorry", actionTitle: "ok", controller: self)

    }

    @objc  func handleLoginUser(){

        guard let email = loginCell.emailText.text, let password = loginCell.passwordText.text else {
            return
        }


        let obj = ViewControllersHTTPRequest()
        let serverData = [
            "membershipNumber": email,
            "password": password
        ]

        obj.loginGetDetails(userInfo: serverData, completion: { (data) in
            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
            self.loginData = data
            SaveUserDataOnRegister.shared.saveDataToPList(userModel: self.loginData?.userDetails)
            self.performSelector(onMainThread: #selector(self.handleLogin), with: nil, waitUntilDone: false)

            

        }) { (error) in
            self.performSelector(onMainThread: #selector(self.stopAnimation), with: nil, waitUntilDone: false)
            self.performSelector(onMainThread: #selector(self.handleShowAlert), with: nil, waitUntilDone: false)
        }
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








}
