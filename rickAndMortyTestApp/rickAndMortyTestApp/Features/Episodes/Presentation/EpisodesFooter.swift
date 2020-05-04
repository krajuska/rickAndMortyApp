//
//  EpisodesFooter.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//
 import UIKit
 import RxSwift
 import RxCocoa

 class EpisodesFooter: UITableViewCell {
     
     let stackView: UIStackView = {
         let stack = UIStackView()
         stack.axis = .horizontal
         stack.alignment = .fill
         stack.distribution = .fillProportionally
         stack.frame.size.height = 83
         return stack
     }()
     
     let charButton: UIButton = {
         let button = UIButton()
         button.setTitle("Character", for: .normal)
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
         button.setTitleColor(UIColor(.gray1), for: .normal)
         return button
     }()
     
     
     let locationButton: UIButton = {
         let button = UIButton()
         button.setTitle("Location", for: .normal)
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
         button.setTitleColor(UIColor(.gray1), for: .normal)
         return button
     }()
     
     let episodeButton: UIButton = {
         let button = UIButton()
         button.setTitle("Episode", for: .normal)
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
         button.setTitleColor(UIColor(.indigo), for: .normal)
         return button
     }()

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         backgroundColor = UIColor(.gray6)
         
         addSubview(stackView)
         stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
         stackView.addArrangedSubview(charButton)
         stackView.addArrangedSubview(locationButton)
         stackView.addArrangedSubview(episodeButton)
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }

