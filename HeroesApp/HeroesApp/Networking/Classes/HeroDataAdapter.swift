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
        apiRequest.getCharacters(with: limit, and: offset)
    }
}
