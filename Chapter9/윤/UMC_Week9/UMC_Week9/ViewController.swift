//
//  ViewController.swift
//  UMC_Week9
//
//  Created by 윤성 on 6/7/24.
//

import UIKit
import Alamofire


class ViewController: UIViewController, XMLParserDelegate {
    
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var centerName1: UILabel!
    @IBOutlet weak var centerName2: UILabel!
    @IBOutlet weak var centerName3: UILabel!
    @IBOutlet weak var centerName4: UILabel!
    
    var centerData:ResponseData?
    
    func fetchData(){
        let url = "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=10"
        
        let headers: HTTPHeaders = [
            "Authorization":  "Infuser DvHJRx1RQXIAjMXQuss0nlvNyy/IbtJ9Z77Xs6BPIFKIF9pA3YtkqbTM5f+4/leAXCRXpDvV8a6tjAZdHYRlsw=="
        ]
        
        AF.request(url, headers: headers).responseData{
            response in
            switch response.result{
            case .success(let data):
                do{
                    self.centerData = try JSONDecoder().decode(ResponseData.self, from: data)
                    DispatchQueue.main.async {
                        //센터 이름 넣기
                        self.centerName.text = self.centerData?.data[0].centerName
                        self.centerName1.text = self.centerData?.data[1].centerName
                        self.centerName2.text = self.centerData?.data[2].centerName
                        self.centerName3.text = self.centerData?.data[3].centerName
                        self.centerName4.text = self.centerData?.data[4].centerName
                    }
                    print("성공")
                    print(self.centerData?.perPage ?? "")
                }catch{
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        
        
        
    }


}

