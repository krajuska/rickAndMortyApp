//
//  LocationCell.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

class LocationCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(.white)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(.gray6).cgColor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(.white)
        return view
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.tintColor = UIColor(.gray3)
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    let locationNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.tintColor = UIColor(.black)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        containerView.addSubview(infoView)
        infoView.anchor(top: topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, width: frame.size.width, height: frame.size.width/2)
        
        infoView.addSubview(typeLabel)
        typeLabel.anchor(top: infoView.topAnchor, left: infoView.leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        infoView.addSubview(locationNameLabel)
        locationNameLabel.anchor(top: typeLabel.bottomAnchor, left: infoView.leftAnchor, right: infoView.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingRight: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

