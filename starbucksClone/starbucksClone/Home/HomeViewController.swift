//
//  ViewController.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 25/07/22.
//

import UIKit

class HomeViewController: BaseClassViewController {
    
    let headerView = HomeHeaderView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    var headerViewTopConstraint : NSLayoutConstraint?
    
    
    let tiles = [//RewardTileViewController(),
                TileViewController(title: "Breakfast made meatless",
                                    subtitle: "Try Beyond Meat, cheddar & Egg sandwich. vegetarian and protein-packed.",
                                    imageName: "meatless"),
                 TileViewController(title: "Uplifting our communities",
                                    subtitle: "Thanks to our partners nominations, The starbucks foundation is donating $145k to more than 50 local charities.",
                                    imageName: "communities"),
                 TileViewController(title: "Spend atleast $15 for 50 Bonus stars",
                                    subtitle: "Collect 50 Bonus stars when you spend atleast $15 pre-tax.",
                                    imageName: "bonus")
                ]
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpTabAndNavBar()
        setupScrollView()
        setUpSignUp()
        self.addStyle()
        self.addLayoutConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setUpTabAndNavBar() {
        
        setTabBarImage(tabname: "Home", imageName: "house.fill")
    }
}

//MARK: Styles and layout properties
extension HomeViewController : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    func addLayoutConstraints() {
        
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        for childVC in tiles {
            
            addChild(childVC)
            stackView.addArrangedSubview(childVC.view)
            childVC.didMove(toParent: self)
        }
                
       headerViewTopConstraint = headerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0)
        
        NSLayoutConstraint.activate([
            
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 1),
            scrollView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: scrollView.trailingAnchor, multiplier: 1),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

//MARK: Scrollview delegate methods
extension HomeViewController : UIScrollViewDelegate {
    
    func setupScrollView() {
        
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let userScrolledHeight = scrollView.contentOffset.y
        let labelHeight = headerView.title.frame.height + 16
        
        let swipingdown = userScrolledHeight <= 0
        let shouldCollapse = userScrolledHeight > labelHeight
        
        UIView.animate(withDuration: 0.3) {
            
            self.headerView.title.alpha = swipingdown ? 1.0 : 0.0
        }

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) {
            
            self.headerViewTopConstraint?.constant = shouldCollapse ? -labelHeight : 0
            self.view.layoutIfNeeded()
        }
    }
}

//MARK: Signup delegate methods

extension HomeViewController : SignUpDelegate {
    
    func setUpSignUp() {
        
        headerView.delegate = self
    }
    
    func signinBtnTapped() {
        
        let VC = SignUpViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
