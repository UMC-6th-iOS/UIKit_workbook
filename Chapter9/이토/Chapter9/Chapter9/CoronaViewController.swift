//
//  CoronaViewController.swift
//  Chapter9
//
//  Created by 문창재 on 6/7/24.
//

import UIKit
import Alamofire


class CoronaViewController: UIViewController {
    @IBOutlet weak var centerName: UILabel!
    
    func fetchCenterData(){
        
        let urlString = "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=1"
        
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    // JSON 데이터를 WeatherData 구조체로 디코딩
                    let centerData = try JSONDecoder().decode(CenterData.self, from: data)
                    // 메인 스레드에서 UI 업데이트
                    DispatchQueue.main.async {
                        self.centerName.text = centerData.centerName ?? ""
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCenterData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
