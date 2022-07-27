//
//  HomeHeaderView.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 25/07/22.
//

import UIKit

protocol SignUpDelegate {
    
    func signinBtnTapped()
}

class HomeHeaderView : UIView {
    
    var delegate : SignUpDelegate?
    
     let title: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.text = "It's a great day for coffee"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private let signinButton: UIButton = {
        
        let btn = UIButton(type: .custom)
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign in", for: .normal)
        btn.setTitleColor(.secondaryLabel, for: .normal)
        btn.setImage(UIImage(systemName: "person", withConfiguration: configuration), for: .normal)
        btn.imageView?.tintColor = .secondaryLabel
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        btn.addTarget(self, action: #selector(signinBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private let InboxButton: UIButton = {
        
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Inbox", for: .normal)
        btn.setImage(UIImage(systemName: "envelope")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return btn
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
extension HomeHeaderView : UIViewNecessaryMethodsDelegate {
    
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
        addSubview(signinButton)
        
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            title.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: title.trailingAnchor, multiplier: 1),
        
            signinButton.topAnchor.constraint(equalToSystemSpacingBelow: title.bottomAnchor, multiplier: 2),
            signinButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 2)
        ])
        
    }
    
}

//MARK: Actions

extension HomeHeaderView {
    
    @objc func signinBtnTapped() {
        
        delegate?.signinBtnTapped()
    }
}
