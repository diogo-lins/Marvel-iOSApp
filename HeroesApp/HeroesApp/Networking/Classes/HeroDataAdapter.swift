//
//  HeroDataAdapter.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 07/12/20.
//

import Foundation

struct HeroDataAdapter: RemoteService {

    let apiRequest: APIRequest

    init(apiRequest: APIRequest = MarvelAPIController()) {
        self.apiRequest = apiRequest
    }

    func getCharacters(with limit: Int, and offset: Int) {
        apiRequest.getCharacters(limit: limit, offset: offset) { result in
            switch result {
            case .success(let jsonAPICharacters): break
            case .failure(let error): break
            }
        }
    }
}
