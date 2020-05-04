//
//  CharacterInfoTableViewHeader.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

class CharacterInfoTableViewHeader: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(.gray1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.anchor(left: self.leftAnchor, paddingLeft: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
