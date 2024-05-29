//
//  ViewController.swift
//  UMC_Week3.1
//
//  Created by 윤성 on 4/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    let products : [productData] = [
        productData(imageViewName: "광고", productName: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다.^^ - 🧅", subTitle: "당근알바 . 이벤트", price: " "),
        productData(imageViewName: "에어팟맥스", productName: "에어팟맥스실버", subTitle: "서울특별시 양천구 . 6일 전", price: "370,000원"),
        productData(imageViewName: "에어팟맥스2", productName: "에어팟 맥스 스페이스그레이 S급 판매합니다.", subTitle: "서울특별시 양천구 . 3시간 전", price: "490,000원"),
        productData(imageViewName: "에어팟맥스3", productName: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", subTitle: "서울특별시 양천구 . 1일 전", price: "550,000원")
    ]
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        settingTableView.dataSource = self
        
        settingTableView.register(UINib(nibName: "ScrollTableViewCell", bundle: nil), forCellReuseIdentifier: "ScrollTableViewCell")
        
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < products.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            
            cell.imageViewName.image = UIImage(named: products[indexPath.row].imageViewName)
            cell.productName.text = products[indexPath.row].productName
            cell.subTitle.text = products[indexPath.row].subTitle
            cell.price.text = products[indexPath.row].price
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollTableViewCell", for: indexPath)
        
        return cell
    }
    
    
}

struct productData{
    var imageViewName : String
    var productName : String
    var subTitle : String
    var price : String
}
