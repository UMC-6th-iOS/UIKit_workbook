//
//  ViewController.swift
//  Chapter7
//
//  Created by 문창재 on 6/7/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser




class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func login(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        KakaoSDK.initSDK(appKey: "ec7a442251d4c169c004d57f19347d7d")
        
        loginButton.setTitle("카카오톡으로 로그인", for: .normal)
        // Do any additional setup after loading the view.
    }


}

