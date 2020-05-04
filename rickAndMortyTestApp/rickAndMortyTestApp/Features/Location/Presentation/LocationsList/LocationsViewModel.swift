//
//  LocationsViewModel.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class LocationsViewModel {
    private let disposeBag: DisposeBag = DisposeBag()
    private let businessModel: LocationsBusinessModel = LocationsBusinessModel()
    func fetchLocationInfo() -> Observable<[LocationDataCell]> {
        return self.businessModel.fetchLocationsCells()
    }
}

