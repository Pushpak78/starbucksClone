//
//  styles.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 25/07/22.
//

import UIKit

extension UIFont {
    
    func withTraits(traits : UIFontDescriptor.SymbolicTraits) -> UIFont {
        
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont{
        
        self.withTraits(traits: UIFontDescriptor.SymbolicTraits.traitBold)
    }
}

extension UIColor {
    
    static let lightGreen = UIColor(red: 0/255, green: 171/255, blue: 90/255, alpha: 1.0)
    static let darkGreen = UIColor(red: 0/255, green: 133/255, blue: 67/255, alpha: 1.0)
}

struct Styles {
    
    static func applyTabBarStyle() {
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10.0)]
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }

    static func applyNavigationBarStyle(titleColor:UIColor = UIColor.black) {
    
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0), NSAttributedString.Key.foregroundColor: titleColor]
        
        /* Removing navigation bar shadow image: There are different approaches.
         This approach requires disabling of translucent effect and settings empty images for bg and shadow */
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    static func makeGreenRoundedButton(with text : String) -> UIButton {
        
        let btn = UIButton()
        btn.configuration = .filled()
        btn.setTitle(text, for: .normal)
        btn.tintColor = .darkGreen
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.contentMode = .center
        btn.layer.cornerRadius = btn.frame.height / 2
        
        return btn
    }

}

    
protocol UIViewNecessaryMethodsDelegate {
        
    func addStyle()
    func addLayoutConstraints()
}


