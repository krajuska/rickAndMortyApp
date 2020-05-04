//
//  LocationsData.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit
import SwiftyJSON

public class LocationDataCell {
    public var name: String = ""
    public var type: String = ""
    public var dimension: String = ""
    public var residents: [String] = [""]
    
    public init(json: JSON) {
        self.name = json["name"].stringValue
        self.type = json["type"].stringValue
        self.dimension = json["dimension"].stringValue
        self.residents = json["residents"].arrayValue.map{$0.stringValue.replacingOccurrences(of: Constants.baseURL, with: "")}
    }
    
    public init(){}
}

public class ResidentDataCell {
    public var name: String = ""
    public var status: String = ""
    public var avatarLink: String = ""
    
    public init(json: JSON) {
    self.name = json["name"].stringValue
    self.status = json["status"].stringValue
    self.avatarLink = json["image"].stringValue
    }
    
    public init(){}
}
