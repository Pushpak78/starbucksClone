//
//  PlaceHolderViewController.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 26/07/22.
//

import UIKit

class PlaceHolderViewController : UIViewController {
    
    let label = UILabel()
    
    init(_ text : String) {
        
        super.init(nibName: nil, bundle: nil)
        label.text = text
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

//MARK: Styles and layout constraints

extension PlaceHolderViewController : UIViewNecessaryMethodsDelegate {
    
     func addStyle() {
        
        label.textColor = .black
        view.backgroundColor = .yellow
        
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
     func addLayoutConstraints() {
         
         view.addSubview(label)
        
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

