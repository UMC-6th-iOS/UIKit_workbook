//
//  ViewController.swift
//  Chapter9-1
//
//  Created by 문창재 on 6/11/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //var centerData:ResponseData?
    
    @IBOutlet weak var CenterName: UILabel!
    
    func fetchData(){
        let url = "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=1"
        
        let headers: HTTPHeaders = [
            "Authorization":  "Infuser +d+Gs/om/5gEldW5IGCcKcN955wrpOZRk3FPPHIdLFHX0LrQ0gU2vYdPzmjgplMbA8vIuBZVMATTlzNvABjizg=="
        ]
        AF.request(url, headers: headers).responseData{
            response in
            switch response.result{
            case .success(let data):
                do{
                    let centerData = try JSONDecoder().decode(ResponseData.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.CenterName.text = "\(centerData.data[0].centerName)"
                    }
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
        //CenterName.text = centerData?.data[0].centerName
        
    }


}

