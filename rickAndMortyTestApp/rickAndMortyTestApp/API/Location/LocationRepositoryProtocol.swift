//
//  LocationRepositoryProtocol.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

protocol LocationRepositoryProtocol {
    func fetchLocationsCells(forPage: Int) -> Observable<JSON>
    func fetchResidentsForPage(pageNumber: String) -> Observable<JSON>
}
