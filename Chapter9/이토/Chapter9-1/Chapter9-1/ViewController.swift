//
//  ViewController.swift
//  Chapter9-1
//
//  Created by 문창재 on 6/11/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var centerData:ResponseData?

    @IBOutlet weak var CoronaTableView: UITableView!
    
    
    func fetchData(){
        let url = "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=10"
        
        let headers: HTTPHeaders = [
            "Authorization":  "Infuser +d+Gs/om/5gEldW5IGCcKcN955wrpOZRk3FPPHIdLFHX0LrQ0gU2vYdPzmjgplMbA8vIuBZVMATTlzNvABjizg=="
        ]
        
        AF.request(url, headers: headers).responseData{
            response in
            switch response.result{
            case .success(let data):
                do{
                    self.centerData = try JSONDecoder().decode(ResponseData.self, from: data)
                    DispatchQueue.main.async {
                        self.CoronaTableView.reloadData()
                                   }
                    print("성공")
                    print(self.centerData?.perPage)
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
        CoronaTableView.delegate = self
        CoronaTableView.dataSource = self
                //CenterName.text = centerData?.data[0].centerName
        
        CoronaTableView.register(UINib(nibName: "CoronaTableViewCell", bundle: nil), forCellReuseIdentifier: "CoronaTableViewCell")
        
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (centerData?.perPage ?? 1) - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoronaTableViewCell", for: indexPath) as! CoronaTableViewCell
        
        cell.sido.text = centerData?.data[indexPath.row].sido
        cell.centerName.text = centerData?.data[indexPath.row].centerName
        
        return cell
    }
    
    
}
