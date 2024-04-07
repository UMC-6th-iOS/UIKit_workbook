//
//  ViewController.swift
//  Chapter1
//
//  Created by 문창재 on 4/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchField: UIImageView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var tabSearch: UITabBarItem!
    @IBOutlet weak var tabHeart: UITabBarItem!
    @IBOutlet weak var tabRecepit: UITabBarItem!
    @IBOutlet weak var tabMy: UITabBarItem!
    
    @IBOutlet weak var coupon: UIButton!
    
    @IBOutlet weak var main: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchField.backgroundColor = .systemMint
        searchField.layer.cornerRadius = 20
        
        tabBar.layer.cornerRadius = 20
        tabSearch.title = "검색"
        tabSearch.image = UIImage(systemName: "magnifyingglass")
        tabHeart.title = "찜"
        tabHeart.image = UIImage(systemName: "heart")
        tabRecepit.title = "주문내역"
        tabRecepit.image = UIImage(systemName: "list.clipboard")
        tabMy.title = "My배민"
        tabMy.image = UIImage(systemName: "person.2.circle")
//        coupon.layer.borderColor = CGColor(red: 0.3, green: 0.2, blue: 0.1, alpha: 1)
        //coupon.tintColor = .black
        main.image = UIImage(named: "배민메인")
        main.contentMode = UIView.ContentMode.scaleAspectFit
    }


}



