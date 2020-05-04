//
//  EpisodesViewModel.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class EpisodesViewModel {
    let businessModel = EpisodesBusinessModel()
    func fetchAllEpisodes() -> Observable<[EpisodeInfoCell]> {
        return businessModel.fetchAllEpisodes()
    }
    
    func fetchEpisodeInfo(episode: String) -> Observable<EpisodeInfoCell> {
        return businessModel.fetchEpisode(episode: episode)
    }
}
