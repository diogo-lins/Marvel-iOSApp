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
    private let decoder: NetworkingJSONDecoder

    init(
        provider: MoyaProvider<MarvelService> = MoyaProvider<MarvelService>(),
        decoder: NetworkingJSONDecoder = JSONDecoder()
    ) {
        self.provider = provider
        self.decoder = decoder
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
                    let characters = try JSONApiCharacters.decoded(by: decoder, from: response.data)
                    completion(.success(characters))
                } catch {
                    completion(.failure(APIError.unableToDecodeData))
                }
            case .failure(_):
                completion(.failure(APIError.unableToConnectHost))
            }
        }
    }
}
