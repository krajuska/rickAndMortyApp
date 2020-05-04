//
//  CharacterHeader.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 30/04/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit
import RxSwift

class CharacterHeader: UICollectionReusableView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Character"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textColor = UIColor(.black)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(.gray6)
    
        addSubview(titleLabel)
        titleLabel.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 16, paddingBottom: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
