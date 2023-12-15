//
//  MenuView.swift
//  MainMenu
//
//  Created by Michael Campbell on 12/15/23.
//

import UIKit

class MenuView: UIView {

    var username: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.text = "Bryce Lynch"
        return label
    }()
    
    var profileButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40), forImageIn: .normal)
        let image = UIImage(systemName: "person.crop.circle.fill")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "Green-0")
        return button
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        return collection
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureLayout()
        configureActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - Setup and layout
    private func configureView() {
        backgroundColor = UIColor(named: "Green-218")
        
        [username, profileButton, collectionView].forEach { addSubview($0) }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
        collectionView.backgroundColor = .clear
    }
    
    private func configureLayout() {
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: topAnchor, constant: 100.0),
            username.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25.0),
            username.widthAnchor.constraint(equalToConstant: Screen.width * 0.50),
            username.heightAnchor.constraint(equalToConstant: 35.0),
            
            profileButton.centerYAnchor.constraint(equalTo: username.centerYAnchor),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35.0),
            profileButton.widthAnchor.constraint(equalToConstant: 80),
            profileButton.heightAnchor.constraint(equalToConstant: 80.0),
            
            collectionView.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 25.0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureActions() {
        
    }
}

extension MenuView: UICollectionViewDelegate { }

extension MenuView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
        let row = indexPath.row
        
        return cell
    }
}

extension MenuView: UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row < 4 {
            let width = collectionView.bounds.width * 0.7
            let numberOfItemsPerRow: CGFloat = 2
            let spacing: CGFloat = 1
            let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
            let itemDimension = floor(availableWidth / numberOfItemsPerRow)
            print("w: \(width)")
            return CGSize(width: itemDimension, height: itemDimension)
        } else {
            let width = collectionView.bounds.width
            let numberOfItemsPerRow: CGFloat = 1
            let spacing: CGFloat = 1
            let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
            let itemDimension = floor(availableWidth / numberOfItemsPerRow)            
            return CGSize(width: 331, height: 100.0)
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        let row = indexPath.row
    }
}
