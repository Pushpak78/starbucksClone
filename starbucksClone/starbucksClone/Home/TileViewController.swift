//
//  TileViewController.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 26/07/22.
//

import UIKit

class TileViewController: UIViewController {
    
    let tileView = TileView()
    
    init(title: String, subtitle: String, imageName: String) {
        
        super.init(nibName: nil, bundle: nil)
        
        tileView.title.text = title
        tileView.subtitle.text = subtitle
        tileView.imageView.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addStyle()
        addLayoutConstraints()
    }
}

//MARK: styles and layout contraints
extension TileViewController : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
        tileView.translatesAutoresizingMaskIntoConstraints = false
        //tileView.layer.cornerRadius = 5
        //tileView.layer.borderWidth = 1
    }
    
    func addLayoutConstraints() {
        
        view.addSubview(tileView)
        
        NSLayoutConstraint.activate([
            
            tileView.topAnchor.constraint(equalTo: view.topAnchor),
            tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
