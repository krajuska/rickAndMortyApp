//
//  CharactersRepositoryProtocol.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

protocol CharactersRepositoryProtocol {
    func fetchCharactersInformation(forPage: Int) -> Observable<JSON>
    func fetchEpisode(episodeID: String) -> Observable<JSON>
}
