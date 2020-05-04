//
//  APIRequest.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 02/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON
import UIKit

class APIRequest {
    
    static func getAllEpisodes() -> Observable<JSON>{
        return request(APIRouter.fetchAllEpisodes)
    }
    static func getCharacters(forPage: Int) -> Observable<JSON> {
        return request(APIRouter.fetchCharacter(forPage: forPage))
    }
    
    static func getCharactersForPage(pageNumber: String) -> Observable<JSON> {
        return request(APIRouter.fetchCharactersByID(IDNumber: pageNumber))
    }
    
    static func getLocations(forPage: Int) -> Observable<JSON> {
        return request(APIRouter.fetchLocation(forPage: forPage))
    }
    
    static func getEpisodes(episodeID: String) -> Observable<JSON> {
        return request(APIRouter.fetchEpisode(episodeID: episodeID))
    }
    
    private static func request(_ urlConvertible: URLRequestConvertible) -> Observable<JSON> {
        return Observable.create { observer in
            let request = AF.request(urlConvertible).responseJSON { (response) in
                switch response.result {
                case .success(let retrievedData):
                    observer.onNext(JSON(retrievedData))
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

