//
//  CharacterDetailsViewModel.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 03/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import RxSwift

class CharacterDetailsViewModel {
    private let disposeBag: DisposeBag = DisposeBag()
    private let businessModel: CharactersBusinessModel = CharactersBusinessModel()
    
    func fetchEpisodeInfo(episode: String) -> Observable<EpisodeInfoCell> {
        return businessModel.fetchEpisode(episode: episode)
    }
}
