//
//  MenuCell.swift
//  MainMenu
//
//  Created by Michael Campbell on 12/15/23.
//

import UIKit

class MenuCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "MenuCell"
    
    var option: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Green-0")
        view.layer.cornerRadius = 15.0
        view.layer.cornerCurve = .continuous
        return view
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
        configureLayout()
        configureActions()
        layoutIfNeeded()
    }

    override func layoutSubviews() {
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - Setup and layout
    private func configureView() {
        [option].forEach { contentView.addSubview($0) }

    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            option.topAnchor.constraint(equalTo: contentView.topAnchor),
            option.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            option.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            option.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func configureActions() {
        
    }
}
