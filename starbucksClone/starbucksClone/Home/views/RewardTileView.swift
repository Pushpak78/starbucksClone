//
//  RewardTileView.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 26/07/22.
//

import UIKit

class RewardTileView : UIView {
    
    let balanceView = BalanceView(balance: String("175"))
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        self.addStyle()
        self.addLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

extension RewardTileView : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
        balanceView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addLayoutConstraints() {
        
        addSubview(balanceView)
        
        NSLayoutConstraint.activate([
            
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0)
        ])
    }
}
