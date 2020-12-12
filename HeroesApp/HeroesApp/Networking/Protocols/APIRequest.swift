//
//  APIRequest.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 09/12/20.
//

import Foundation

protocol APIRequest {
    func getCharacters(
        limit: Int,
        offset: Int,
        completion: @escaping (Result<JSONApiCharacters, Error>) -> Void
    )
}
