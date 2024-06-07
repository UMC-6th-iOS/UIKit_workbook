//
//  ViewController.swift
//  UMC_Week8
//
//  Created by 윤성 on 6/4/24.
//

import UIKit

struct User {
    var Id : String
    var password : String
}
var users: [User] = [
    User(Id: "1111", password: "2222")
]

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func login(_ sender: Any) {
        for user in users {
            if idTextField.text == user.Id && passwordTextField.text == user.password {
                label.text = "로그인 성공"
            }
            else {
                label.text = "로그인 실패"
            }
        }
    }
    
    @IBOutlet weak var signButton: UIButton!
    @IBAction func signUp(_ sender: Any) {
        let userId : String = idTextField.text ?? ""
        let userPw : String = passwordTextField.text ?? ""
        
        for user in users {
            if userId == user.Id {
                label.text = "중복된 아이디"
            }
            else {
                users.append(User(Id: userId, password: userPw))
                label.text = "회원가입 성공"
            }
        }
    }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
}

