//
//  SceneDelegate.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 25/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        Styles.applyTabBarStyle()
        Styles.applyNavigationBarStyle()
        let homeVC = HomeViewController()
        let scanVC = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let storeVC = StoreViewController()
                        
        let homeNC = makeNavigationController(with: homeVC)
        let scanNC = makeNavigationController(with: scanVC)
        let orderNC = makeNavigationController(with: orderVC)
        let giftNC = makeNavigationController(with: giftVC)
        let storeNC = makeNavigationController(with: storeVC)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNC, scanNC, orderNC, giftNC, storeNC]
        tabBarController.tabBar.tintColor = .lightGreen
        window.rootViewController = tabBarController
        
        self.window = window
        self.window?.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
    }
    
    func makeNavigationController(with rootVC : UIViewController) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootVC)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.label]
        
        navigationController.navigationBar.largeTitleTextAttributes = attrs
        
        return navigationController
    }
}

