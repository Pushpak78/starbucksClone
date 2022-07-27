//
//  BalanceView.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 26/07/22.
//

import UIKit

class BalanceView : UIView {
    
    let pointsLabel = UILabel()
    let starView = UIImageView()
    let starBalanceLabel = UILabel()
    
    
    init(balance : String) {
        
        super.init(frame: .zero)
        pointsLabel.text = balance
        self.addStyle()
        self.addLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: styles and layout

extension BalanceView : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
                
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = UIColor(named: "starColor")
        starView.image = UIImage(systemName: "star.fill")
        starView.contentMode = .scaleAspectFit
                
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .secondaryLabel
        starBalanceLabel.text = "Star balance"
    }
    
    func addLayoutConstraints() {
        
        addSubview(pointsLabel)
        addSubview(starView)
        addSubview(starBalanceLabel)
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            starView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: -2),
            starView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 4),
            starView.heightAnchor.constraint(equalToConstant: 15),
            
            starBalanceLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor, constant: 0),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointsLabel.leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
