//
//  FloatingLabelTextField.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 27/07/22.
//

import UIKit

class FloatingLabelTextField : UITextField {
    
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero)
    var floatingLabelHeight: CGFloat = 14 // Default height
    
    @IBInspectable
    var _placeholder: String?
    
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.black {
        didSet {
            
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var activeBorderColor: UIColor = UIColor.blue
    
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder
        placeholder = self._placeholder
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: textField actions

extension FloatingLabelTextField {
    
    @objc func addFloatingLabel() {
        
        if self.text == "" {
            
            self.floatingLabel.textColor = floatingLabelColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self._placeholder
            self.floatingLabel.layer.backgroundColor = UIColor.white.cgColor
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.floatingLabel.clipsToBounds = true
            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
    self.layer.borderColor = self.activeBorderColor.cgColor
            self.addSubview(self.floatingLabel)
          
            self.floatingLabel.bottomAnchor.constraint(equalTo:
            self.topAnchor, constant: -10).isActive = true // Place our label 10pts above the text field
            // Remove the placeholder
            self.placeholder = ""
        }
        self.setNeedsDisplay()
    }
    
    @objc func removeFloatingLabel() {
        
        if self.text == "" {
            
            UIView.animate(withDuration: 0.13) {
                
               self.subviews.forEach{ $0.removeFromSuperview() }
               self.setNeedsDisplay()
            }
            self.placeholder = self._placeholder
        }
        self.layer.borderColor = UIColor.black.cgColor
    }
}

//MARK: Layout Constraints

extension FloatingLabelTextField {
    
    func addLayoutConstraints() {
        
    }
}
