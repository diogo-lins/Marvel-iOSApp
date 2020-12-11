//
//  RemoteService.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 07/12/20.
//

import Foundation

protocol RemoteService {
    func getCharacters(with limit: Int, and offset: Int)
}
