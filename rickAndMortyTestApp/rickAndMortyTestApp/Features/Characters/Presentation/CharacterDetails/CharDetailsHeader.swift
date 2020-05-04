//
//  CharDetailsHeaderView.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

class CharDetailsHeader: UITableViewCell {
    
    let avatarContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let circleAvatar: UIImageView = {
       let canvas = UIImageView()
        canvas.image = UIImage()
        canvas.contentMode = .scaleAspectFill
        canvas.layer.borderWidth = 10
        canvas.layer.borderColor = UIColor(.gray6).cgColor
        canvas.layer.masksToBounds = true
        return canvas
    }()
    
    let bgView: UIView = {
        let view = UIView()
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        var image = UIImageView()
        image.image = UIImage(named: "floatingHeads")
        image.layer.masksToBounds = true
        image.contentMode = .center
        view.addSubview(image)
        image.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        view.addSubview(blurEffectView)
        blurEffectView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        return view
    }()
    
    let plainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(.gray6)
        return view
    }()
    
    let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(.gray6)
        return view
    }()
    
    let lifeStatusLabel: UILabel = {
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
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        _ = label.text?.uppercased()
        label.tintColor = UIColor(.gray1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(avatarContainer)
        avatarContainer.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        avatarContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.67).isActive = true
        
        avatarContainer.addSubview(bgView)
        bgView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        bgView.heightAnchor.constraint(equalTo: avatarContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        avatarContainer.addSubview(plainView)
        plainView.anchor(top: bgView.bottomAnchor, left: leftAnchor, bottom: avatarContainer.bottomAnchor, right: rightAnchor)
        plainView.heightAnchor.constraint(equalTo: avatarContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(circleAvatar)
        circleAvatar.centerYAnchor.constraint(equalTo: avatarContainer.centerYAnchor).isActive = true
          circleAvatar.centerXAnchor.constraint(equalTo: avatarContainer.centerXAnchor).isActive = true
        circleAvatar.anchor(width: 230, height: 230)
        circleAvatar.layer.cornerRadius = 230/2
        
        
        addSubview(infoView)
        infoView.anchor(top: avatarContainer.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        infoView.addSubview(lifeStatusLabel)
        lifeStatusLabel.anchor(top: infoView.topAnchor, paddingTop: 20, height: 13)
        lifeStatusLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        
        infoView.addSubview(nameLabel)
        nameLabel.anchor(top: lifeStatusLabel.bottomAnchor, paddingTop: 5, height: 34)
        nameLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        
        infoView.addSubview(speciesLabel)
        speciesLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 5, height: 18)
        speciesLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
