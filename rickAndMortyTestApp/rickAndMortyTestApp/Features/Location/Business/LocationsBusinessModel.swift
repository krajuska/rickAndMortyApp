//
//  LocationsBusinessModel.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift
import UIKit

class LocationsBusinessModel {
    fileprivate let locationRepository: LocationRepositoryProtocol = LocationRepository()

    var pageCount: Int = 1
    var maxPage = Int()
    var fetchedResidents = [ResidentDataCell]()
    
    func fetchLocationsCells() -> Observable<[LocationDataCell]> {
        if pageCount == 1 || pageCount <= maxPage {
            return locationRepository.fetchLocationsCells(forPage: pageCount).flatMap { json -> Observable<[LocationDataCell]> in
                let info = json["info"]
                self.maxPage = info["pages"].intValue
                self.pageCount += 1
                var array = [LocationDataCell]()
                let results = json["results"]
                for i in 0..<results.count {
                    let char = LocationDataCell(json:results[i])
                    array.append(char)
                }
                return Observable.just(array)
            }
        } else {
            return Observable.just([LocationDataCell]())
        }
    }
    
    func fetchResident(page: String) -> Observable<ResidentDataCell> {
        return locationRepository.fetchResidentsForPage(pageNumber: page).flatMap { json -> Observable<ResidentDataCell> in
            let resident = ResidentDataCell(json: json)
            self.fetchedResidents.append(resident)
            return Observable.just(resident)
        }
    }
}

