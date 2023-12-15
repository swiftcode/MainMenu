//
//  MenuViewController.swift
//  MainMenu
//
//  Created by Michael Campbell on 12/15/23.
//

import UIKit

class MenuViewController: UIViewController {

    var menuView: MenuView = {
        let view = MenuView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureLayout()
        configureActions()
        
    }
    
    //MARK: - Setup and layout
    private func configureView() {
        view.addSubview(menuView)
    }
    
    private func configureLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureActions() {
        
    }
}
