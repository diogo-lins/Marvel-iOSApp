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

    func getCharacters(
        limit: Int,
        offset: Int,
        completion: @escaping (Result<JSONApiCharacters, Error>) -> Void
    ) {
        provider.request(.getCharacters(limit: limit, offset: offset)) { result in
            switch result {
            case .success(let response):
                do {
                    let characters = try JSONApiCharacters.decoded(by: JSONDecoder(), from: response.data)
                    completion(.success(characters))
                } catch {
                    completion(.failure(APIError.unableToDecodeData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getCharacterDetails(with id: Int) {

    }
}
