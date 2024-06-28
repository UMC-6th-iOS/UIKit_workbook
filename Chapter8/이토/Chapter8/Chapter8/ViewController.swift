//
//  ViewController.swift
//  Chapter8
//
//  Created by 문창재 on 6/7/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        guard let id = idTextField.text, !id.isEmpty else {
            return print("아이디를 입력해주세요.")
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            return print("비밀번호를 입력해주세요.")
        }
        
        // 아이디 중복 확인
        if isUsernameTaken(id) {
            print("이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.")
        } else {
            // 새로운 아이디 저장
            saveNewUsername(id)
            // 비밀번호 저장
            UserDefaults.standard.set(password, forKey: id)
            print("회원가입이 완료되었습니다.")
        }
    }
    
    // UserDefaults에서 아이디 목록을 가져오는 메서드
       func getSavedUsernames() -> [String] {
           return UserDefaults.standard.array(forKey: "Usernames") as? [String] ?? []
       }
       
       // 새로운 아이디가 이미 존재하는지 확인하는 메서드
       func isUsernameTaken(_ username: String) -> Bool {
           return getSavedUsernames().contains(username)
       }
       
       // 새로운 아이디를 UserDefaults에 저장하는 메서드
       func saveNewUsername(_ username: String) {
           var usernames = getSavedUsernames()
           usernames.append(username)
           UserDefaults.standard.set(usernames, forKey: "Usernames")
       }
    
    func showLoginResultAlert(isSuccess: Bool) {
        let alert = UIAlertController(title: isSuccess ? "로그인 성공" : "로그인 실패",
                                      message: isSuccess ? "환영합니다!" : "아이디 또는 비밀번호가 일치하지 않습니다.",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }

    


    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let id = idTextField.text else{
            return print("write id")
        }
        guard let password = passwordTextField.text else{
            return print("write pw")
        }

        // UserDefaults에서 비밀번호 조회
        if let savedPassword = UserDefaults.standard.string(forKey: id), savedPassword == password {
            // 로그인 성공 처리
            showLoginResultAlert(isSuccess: true)
        } else {
            // 로그인 실패 처리
            showLoginResultAlert(isSuccess: false)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

