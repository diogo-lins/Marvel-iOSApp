//
//  RemoteService.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 07/12/20.
//

import Foundation

protocol RemoteService {
    func getCharacter(with limit: Int, and offset: Int)
    func getCharacterDetails(with id: Int)
}
