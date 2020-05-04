//
//  LocationDetailsHeader.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

class LocationDetailsHeader: UICollectionReusableView {
    
    let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(.gray6)
        return view
    }()
    
    let type: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.tintColor = UIColor(.gray3)
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.tintColor = UIColor(.black)
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    let dimension: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        _ = label.text?.uppercased()
        label.tintColor = UIColor(.gray1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(infoView)
        infoView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        infoView.addSubview(type)
        type.anchor(top: infoView.topAnchor, paddingTop: 20, height: 13)
        type.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        
        infoView.addSubview(nameLabel)
        nameLabel.anchor(top: type.bottomAnchor, paddingTop: 5, height: 34)
        nameLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        
        infoView.addSubview(dimension)
        dimension.anchor(top: nameLabel.bottomAnchor, paddingTop: 5, height: 18)
        dimension.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
