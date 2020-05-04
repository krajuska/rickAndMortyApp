//
//  LocationRepository.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import SwiftyJSON
import RxSwift
import Alamofire
import UIKit

class LocationRepository: LocationRepositoryProtocol {
    func fetchLocationsCells(forPage: Int) -> Observable<JSON> {
        return APIRequest.getLocations(forPage: forPage)
    }
    
    func fetchResidents(forPage: Int) -> Observable<JSON> {
        return APIRequest.getCharacters(forPage: forPage)
    }
    
    func fetchResidentsForPage(pageNumber: String) -> Observable<JSON> {
        return APIRequest.getCharactersForPage(pageNumber: pageNumber)
    }
}

