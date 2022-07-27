//
//  BaseClassViewController.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 25/07/22.
//

import UIKit

class BaseClassViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
    func setTabBarImage(tabname: String, imageName: String) {
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: tabname, image: image, tag: 0)
    }
}


class ScanViewController : BaseClassViewController {
    
    override func viewDidLoad() {
        
        
        title = "Scan"
    }
    
    override func commonInit() {
        
        setTabBarImage(tabname: "Scan", imageName: "qrcode")
    }
}

class OrderViewController : BaseClassViewController {
    
    override func viewDidLoad() {
        
        //view.backgroundColor = .orange
        title = "Orders"
    }
    
    override func commonInit() {
        
        setTabBarImage(tabname: "Orders", imageName: "arrow.up.bin.fill")
    }
}

class GiftViewController : BaseClassViewController {
    
    override func viewDidLoad() {
        
        //view.backgroundColor = .purple
        title = "Gifts"
    }
    
    override func commonInit() {
        
        setTabBarImage(tabname: "Gifts", imageName: "gift.fill")
    }
}

class StoreViewController : BaseClassViewController {
    
    override func viewDidLoad() {
        
       // view.backgroundColor = .blue
        title = "Stores"
    }
    
    override func commonInit() {
        
        setTabBarImage(tabname: "Stores", imageName: "location.fill")
    }
}
