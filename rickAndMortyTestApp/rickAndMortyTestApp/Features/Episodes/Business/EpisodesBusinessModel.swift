//
//  EpisodesBusinessModel.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

class EpisodesBusinessModel {
    let episodesRepository: EpisodesRepositoryProtocol = EpisodesRepository()
    var episodes = [EpisodeInfoCell]()
    
    func fetchAllEpisodes() -> Observable<[EpisodeInfoCell]> {
        return episodesRepository.fetchAllEpisodes().flatMap{ json -> Observable<[EpisodeInfoCell]> in
            let count = json["info"]["count"].intValue
            for i in 0..<count {
                self.episodes.append(EpisodeInfoCell(json: json["results"][i]))
            }
            return Observable.just(self.episodes)
        }
    }
    
    func fetchEpisode(episode: String) -> Observable<EpisodeInfoCell> {
        return episodesRepository.fetchEpisode(episodeID: episode).flatMap{ json -> Observable<EpisodeInfoCell> in
            let episode = EpisodeInfoCell(json: json)
            return Observable.just(episode)
        }
    }
}
