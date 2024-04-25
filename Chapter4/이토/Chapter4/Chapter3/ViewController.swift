//
//  ViewController.swift
//  Chapter3
//
//  Created by 문창재 on 4/19/24.
//

import UIKit

class ViewController: UIViewController {
    var settingModel = [CarrotData]()
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData(){
        settingModel.append(CarrotData(name: "에어팟맥스", image: "에어팟맥스", price: "550,000원", location: "서울시 양재구"))
        settingModel.append(CarrotData(name: "애플워치", image: "애플워치", price: "270,000원", location: "가좌동 고양구"))
        settingModel.append(CarrotData(name: "아이폰", image: "아이폰", price: "100,000원", location: "어디지"))
        settingModel.append(CarrotData(name: "맥북", image: "맥북", price: "1,000,000원", location: "어디냐고"))
    }
    
    override func viewDidLoad() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        super.viewDidLoad()
        makeData()
        let nib:UINib = UINib(nibName: "CarrotTableViewCell", bundle: nil)
        let scrollNib:UINib = UINib(nibName: "ScrollableTableViewCell", bundle: nil)
        settingTableView.register(scrollNib, forCellReuseIdentifier: "ScrollableTableViewCell")
        settingTableView.register(nib, forCellReuseIdentifier: "CarrotTableViewCell")
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < settingModel.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarrotTableViewCell", for: indexPath)
            as! CarrotTableViewCell
            cell.imageViewName.image = UIImage(named: settingModel[indexPath.row].image)
            cell.title.text = settingModel[indexPath.row].name
            cell.location.text = settingModel[indexPath.row].location
            cell.price.text = settingModel[indexPath.row].price
            
            return cell
        }
        
        
        if indexPath.row == settingModel.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollableTableViewCell", for: indexPath)
            return cell
        }
        return UITableViewCell.init()
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == settingModel.count{
//            return 150
//        }
//        return 150
//    }
    
   
    
}
