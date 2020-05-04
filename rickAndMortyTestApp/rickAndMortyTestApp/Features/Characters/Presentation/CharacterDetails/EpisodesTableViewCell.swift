//
//  EpisodesTableViewCell.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    
    let episodeNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor(.black)
        return label
    }()
    
    let episodeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(.gray3)
        return label
    }()
    
    let episodeDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = UIColor(.gray1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(episodeNumberLabel)
        episodeNumberLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 9, paddingLeft: 16, height: 22)
        
        addSubview(episodeNameLabel)
        episodeNameLabel.anchor(top: episodeNumberLabel.bottomAnchor, left: leftAnchor, paddingTop: 5, paddingLeft: 16, height: 18)
        
        addSubview(episodeDateLabel)
        episodeDateLabel.anchor(top: episodeNameLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeft: 16, paddingBottom: 11, height: 13)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
