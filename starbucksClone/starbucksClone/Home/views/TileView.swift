//
//  TileView.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 26/07/22.
//

import UIKit

class TileView : UIView {
    
    let imageView = UIImageView()
    let title = UILabel()
    let subtitle = UILabel()
    let orderBtn = Styles.makeGreenRoundedButton(with: "Order")
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        addStyle()
        addLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 6
    private var fillColor: UIColor = .white
         
    override func layoutSubviews() {
        
        super.layoutSubviews()
        addShadow()
    }
}

//MARK: styles and layout constraints
extension TileView : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .label
        title.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        title.adjustsFontForContentSizeCategory = true
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = .secondaryLabel
        subtitle.font = UIFont.preferredFont(forTextStyle: .footnote)
        subtitle.numberOfLines = 0
        subtitle.lineBreakMode = .byWordWrapping
        
        orderBtn.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func addShadow() {
        
        shadowLayer = CAShapeLayer()
        
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 1
        
        layer.insertSublayer(shadowLayer, at: 0)
        layer.cornerRadius = cornerRadius
    }
    
    func addLayoutConstraints() {
        
        addSubview(imageView)
        addSubview(title)
        addSubview(subtitle)
        addSubview(orderBtn)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            imageView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -1),
            
            title.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            title.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            title.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -2),
            
            subtitle.topAnchor.constraint(equalToSystemSpacingBelow: title.bottomAnchor, multiplier: 1),
            subtitle.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            subtitle.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -2),
            
            orderBtn.topAnchor.constraint(equalToSystemSpacingBelow: subtitle.bottomAnchor, multiplier: 3),
            orderBtn.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: orderBtn.bottomAnchor, multiplier: 2)
            
        ])
    }
}
