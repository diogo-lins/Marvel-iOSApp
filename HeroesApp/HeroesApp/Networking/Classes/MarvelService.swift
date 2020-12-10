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
        guard let apiURL = Bundle.plistURLValue(with: "BaseAPIUrl") else { fatalError("Base URL API error") }
        return apiURL
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
            return .requestParameters(parameters: ["ts": KeyAccessBuilder.getTimeStamp(),
                                                   "hash": KeyAccessBuilder.getHash(),
                                                   "apikey": KeyAccessBuilder.getPublicKey(),
                                                   "limit": limit,
                                                   "offset": offset], encoding: URLEncoding.queryString)
        case .getCharracterDetails(let id):
            return .requestParameters(parameters: ["characterId": id,
                                                   "hash": KeyAccessBuilder.getHash(),
                                                   "apikey": KeyAccessBuilder.getPublicKey()], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
}

