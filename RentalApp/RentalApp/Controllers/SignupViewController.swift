//
//  LoginViewController.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class SignupViewController: UIViewController {
    var signupView : SignupView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        signupView = SignupView()
        signupView.submitButton.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        view.addSubview(signupView)
        signupView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        signupView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        signupView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        signupView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func submitAction() {
        if let email = signupView.emailTextField.text, let password = signupView.passwordTextField.text, let name = signupView.nameTextField.text {
            let params : [String : Any] = [
                "email" : email,
                "password" : password,
                "name" : name
            ]
            ApiRequest.getInstance().sendPost(url: "signup", parameters: params, finished: {(result) -> Void in
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
    
    func switchToMainVCAction(user : User) {
        let vc = ItemListViewController()
        vc.user = user
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
}
