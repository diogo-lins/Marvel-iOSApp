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

    func getCharacters(with limit: Int, and offset: Int) {
        provider.request(.getCharacters(limit: limit, offset: offset)) { (result) in
            switch result {
            case .success(let response):
                //TODO Criar modelo Codable que faz seu proprio decode
                do {
                    let stub = try JSONApiCharacters.decoded(by: JSONDecoder(), from: response.data)
                    print(stub)
                } catch {

                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
