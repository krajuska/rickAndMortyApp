//
//  CharactersRepository.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import SwiftyJSON
import RxSwift
import Alamofire
import UIKit

class CharactersRepository: CharactersRepositoryProtocol {
    func fetchCharactersInformation(forPage: Int) -> Observable<JSON> {
        return APIRequest.getCharacters(forPage: forPage)
    }
    
    func fetchEpisode(episodeID: String) -> Observable<JSON> {
        return APIRequest.getEpisodes(episodeID: episodeID)
    }
}
