//
//  EpisodesRepository.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import RxSwift
import SwiftyJSON

class EpisodesRepository: EpisodesRepositoryProtocol {
    func fetchAllEpisodes() -> Observable<JSON> {
        return APIRequest.getAllEpisodes()
    }
    
    func fetchEpisode(episodeID: String) -> Observable<JSON> {
        return APIRequest.getEpisodes(episodeID: episodeID)
    }
}
