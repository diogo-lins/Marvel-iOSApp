//
//  JSONApiCharacters.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 10/12/20.
//

import Foundation

struct JSONApiCharacters: Codable {
    let code: Int
    let status: String
    let data: CharacterData

    static func decoded(by decoder: NetworkingJSONDecoder, from data: Data) throws -> JSONApiCharacters {
        return try decoder.decode(JSONApiCharacters.self, from: data)
    }
}

struct CharacterData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [CharacterResult]
}

struct CharacterResult: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let path: String
    let ext: String

    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }

    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        path = try data.decode(String.self, forKey: .path)
        ext = try data.decode(String.self, forKey: .ext)
    }

    func getUrl() -> URL? {
        return URL(string: "\(path).\(ext)")
    }
}
