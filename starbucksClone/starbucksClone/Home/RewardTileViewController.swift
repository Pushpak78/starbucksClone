//
//  RewardTileViewController.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 26/07/22.
//

import UIKit

class RewardTileViewController : UIViewController {
    
    let rewardTileView = RewardTileView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.addStyle()
        self.addLayoutConstraints()
    }
    
}

//MARK: styles and layout constraints

extension RewardTileViewController : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
        rewardTileView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addLayoutConstraints() {
        
        view.addSubview(rewardTileView)
        
        NSLayoutConstraint.activate([
        
            rewardTileView.topAnchor.constraint(equalTo: view.topAnchor),
            rewardTileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rewardTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            view.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    
}


