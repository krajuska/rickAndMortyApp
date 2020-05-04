//
//  CharactersBusinessModel.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift
import UIKit

class CharactersBusinessModel {
    fileprivate let charactersRepository: CharactersRepositoryProtocol = CharactersRepository()
    
    var pageCount: Int = 1
    var maxPage = Int()
    
    func fetchCharactersCells(forPage: Int) -> Observable<[CharCell]> {
        return charactersRepository.fetchCharactersInformation(forPage: pageCount).flatMap { json -> Observable<[CharCell]> in
        let info = json["info"]
        self.maxPage = info["pages"].intValue
        self.pageCount = forPage + 1
        var array = [CharCell]()
        let results = json["results"]
        for i in 0..<results.count {
            let char = CharCell(json:results[i])
            array.append(char)
            }
            return Observable.just(array)
        }
    }
    
    func fetchCharactersCells() -> Observable<[CharCell]> {
        if pageCount == 1 || pageCount <= maxPage {
            return charactersRepository.fetchCharactersInformation(forPage: pageCount).flatMap { json -> Observable<[CharCell]> in
                let info = json["info"]
                self.maxPage = info["pages"].intValue
                self.pageCount += 1
                var array = [CharCell]()
                let results = json["results"]
                for i in 0..<results.count {
                    let char = CharCell(json:results[i])
                    array.append(char)
                }
                return Observable.just(array)
            }
        } else {
            return Observable.just([CharCell]())
        }
    }
    
    func fetchEpisode(episode: String) -> Observable<EpisodeInfoCell> {
        return charactersRepository.fetchEpisode(episodeID: episode).flatMap{ json -> Observable<EpisodeInfoCell> in
            let episode = EpisodeInfoCell(json: json)
            return Observable.just(episode)
        }
    }
}
