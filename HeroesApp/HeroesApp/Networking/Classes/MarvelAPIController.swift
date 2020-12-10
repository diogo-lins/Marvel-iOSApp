//
//  MarvelApiController.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 09/12/20.
//

import Foundation
import Moya

struct MarvelAPIController: APIRequest {

    private let provider: MoyaProvider<MarvelService>

    init(provider: MoyaProvider<MarvelService> = MoyaProvider<MarvelService>()) {
        self.provider = provider
    }

    func getCharacter(with limit: Int, and offset: Int) {
        provider.request(.getCharacters(limit: limit, offset: offset)) { (result) in
            switch result {
            case .success(let response):
                let json = try! JSONSerialization.jsonObject(with: response.data, options: [])
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getCharacterDetails(with id: Int) {
        
    }
}
