//
//  EpisodesRepositoryProtocol.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//
import RxSwift
import SwiftyJSON

protocol EpisodesRepositoryProtocol {
    func fetchAllEpisodes() -> Observable<JSON>
    func fetchEpisode(episodeID: String) -> Observable<JSON>
}
