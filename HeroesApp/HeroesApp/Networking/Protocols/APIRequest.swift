//
//  APIRequest.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 09/12/20.
//

import Foundation

protocol APIRequest {
    func getCharacter(with limit: Int, and offset: Int)
    func getCharacterDetails(with id: Int)
}
