//
//  SignUpHeaderView.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 26/07/22.
//

import UIKit

class SignUpHeaderView : UIView {
    
     let title: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.text = "My Starbucks Rewards"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 6
    private var fillColor: UIColor = .white
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        addLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        addShadow()
    }
}

//MARK: styles and layout constraints
extension SignUpHeaderView : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
    }
    
    func addShadow() {
        
        shadowLayer = CAShapeLayer()
        
        shadowLayer.path = UIBezierPath(rect: bounds).cgPath
        //UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        
        shadowLayer.shadowColor = UIColor.gray.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 1
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func addLayoutConstraints() {
        
        addSubview(title)
        
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            title.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: title.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalTo: title.bottomAnchor, constant: 2)
        ])
        
    }
    
}

