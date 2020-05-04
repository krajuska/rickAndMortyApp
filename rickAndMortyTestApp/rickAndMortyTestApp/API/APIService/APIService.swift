//
//  APIService.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

enum APIRouter: URLRequestConvertible {
    case fetchCharacter(forPage: Int)
    case fetchLocation(forPage: Int)
    case fetchEpisode(episodeID: String)
    case fetchCharactersByID(IDNumber: String)
    case fetchAllEpisodes
    case baseURL
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.appending(endpoint).asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: nil)
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    private var endpoint: String {
        switch self {
        case .fetchCharacter(let page):
            return "character/?page=\(page)"
        case .fetchEpisode(let url):
            return url
        case .fetchLocation(let page):
            return "location/?page=\(page)"
        case .fetchCharactersByID(let ID):
            return "\(ID)"
        case .fetchAllEpisodes:
            return "episode/"
        case .baseURL:
            return ""
        }
    }
}
