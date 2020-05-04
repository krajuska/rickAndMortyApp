//
//  CharCellData.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit
import SwiftyJSON

public class CharCell {
    public var name: String = ""
    public var status: String = ""
    public var avatarLink: String = ""
    public var avatar: UIImage = UIImage()
    public var gender: String = ""
    public var species: String = ""
    public var origin: String = ""
    public var type: String = ""
    public var location: String = ""
    public var episodes : [String] = [String]()

    public init(json: JSON) {
        self.name = json["name"].stringValue
        self.status = json["status"].stringValue
        self.avatarLink = json["image"].stringValue
        self.gender = json["gender"].stringValue
        self.species = json["species"].stringValue
        self.origin = json["origin"]["name"].stringValue
        self.type = json["type"].stringValue
        self.location = json["location"]["name"].stringValue
        self.episodes = json["episode"].arrayValue.map{$0.stringValue.replacingOccurrences(of: Constants.baseURL, with: "")}
    }
    
    public init(){}
}

public class EpisodeInfoCell {
    public var episode: String = ""
    public var name: String = ""
    public var date: String = ""
    
    public init(json: JSON) {
        self.episode = json["episode"].stringValue
        self.name = json["name"].stringValue
        self.date = json["air_date"].stringValue
    }
    
    public init(){}
}
