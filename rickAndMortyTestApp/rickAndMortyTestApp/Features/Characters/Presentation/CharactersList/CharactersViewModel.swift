//
//  CharactersViewModel.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class CharactersViewModel {
    private let disposeBag: DisposeBag = DisposeBag()
    private let businessModel: CharactersBusinessModel = CharactersBusinessModel()
    
    func fetchCaractersCells(forcePage: Bool = false) -> Observable<[CharCell]> {
        if forcePage {
            return self.businessModel.fetchCharactersCells(forPage: 1)
        } else{
            return self.businessModel.fetchCharactersCells()
        }
    }
}

