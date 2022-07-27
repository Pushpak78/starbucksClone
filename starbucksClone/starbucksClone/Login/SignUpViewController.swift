//
//  SignUpViewController.swift
//  starbucksClone
//
//  Created by OMNIADMIN on 26/07/22.
//

import UIKit


class SignUpViewController : UIViewController {
    
    var viewModel = SignUpViewModel(userdata: UserData())
    
    let headerView = SignUpHeaderView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let loginDetailsView = LoginDetailsView()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
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
}

extension SignUpViewController : UIViewNecessaryMethodsDelegate {
    
    func addStyle() {
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        loginDetailsView.translatesAutoresizingMaskIntoConstraints = false
                                            
        stackView.axis = .vertical
        stackView.spacing  = 5
    }
    
    func addLayoutConstraints() {
        
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(loginDetailsView)
        
        
        
        NSLayoutConstraint.activate([
             
            headerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
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
