//
//  MarvelService.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 09/12/20.
//

import Foundation
import Moya

enum MarvelService {
    case getCharacters(limit: Int, offset: Int)
    case getCharracterDetails(id: Int)
}

extension MarvelService: TargetType {
    var baseURL: URL {
        return URL(string: "https://gateway.marvel.com")!
    }

    var path: String {
        switch self {
        case .getCharacters(_):
            return "/v1/public/characters"
        case .getCharracterDetails(let id):
            return "/v1/public/characters/\(id)"
        }
    }

    var method: Moya.Method {
        .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .getCharacters(let limit, let offset):
            return .requestParameters(parameters: ["ts": "\(Date().timeIntervalSince1970)",
                                                   "hash": "asdasdasda23213123123sdasdasdasda12312312321sdasdasdasd",
                                                   "apikey": "9ac938891e63bf8f38ff77e4a2ed808e",
                                                   "limit": limit,
                                                   "offset": offset], encoding: URLEncoding.queryString)
        case .getCharracterDetails(let id):
            return .requestParameters(parameters: ["characterId": id,
                                                   "hash": "asdasdasda23213123123sdasdasdasda12312312321sdasdasdasd",
                                                   "apikey": "9ac938891e63bf8f38ff77e4a2ed808e"], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
}

