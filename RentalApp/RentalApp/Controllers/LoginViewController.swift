//
//  LoginViewController.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    var loginView : LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        loginView = LoginView()
        loginView.submitButton.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        view.addSubview(loginView)
        loginView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func submitAction() {
        if let email = loginView.emailTextField.text, let password = loginView.passwordTextField.text {
            let params : [String : Any] = [
                "email" : email,
                "password" : password
            ]
            ApiRequest.getInstance().sendPost(url: "login", parameters: params, finished: {(result) -> Void in
                if result.contains("id") {
                    let user = User().saveUser(json: result)
                    DispatchQueue.main.async {
                        self.switchToMainVCAction(user: user!)
                    }
                } else {
                    let alert = UIAlertController(title: "Error", message: result, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: false, completion: nil)
                }
            })
        }
        
    }
    
    func switchToMainVCAction(user: User) {
        let vc = ItemListViewController()
        vc.user = user
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
}
