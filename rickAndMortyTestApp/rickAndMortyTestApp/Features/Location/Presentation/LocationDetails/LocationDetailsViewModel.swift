//
//  LocationDetailsViewModel.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class LocationDetailsViewModel {
    let businessModel = LocationsBusinessModel()
    var fetchedResidents = [ResidentDataCell]()
    
    func fetchResidents(residentID: String) -> Observable<ResidentDataCell> {
        return businessModel.fetchResident(page: residentID)
    }
    
    func treatURL(urls: [String]) -> [String] {
        var pageNumberArray = [String]()
        for i in 0..<urls.count {
            let treatedURL = urls[i].filter("0123456789.".contains)
            pageNumberArray.append(treatedURL)
        }
        return pageNumberArray
    }
}
