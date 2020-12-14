//
//  NetworkingJSONDecoderMock.swift
//  HeroesAppTests
//
//  Created by Diogo Moreira on 13/12/20.
//
import Foundation
@testable import HeroesApp

class NetworkingJSONDecoderMockFailure: NetworkingJSONDecoder {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        throw ErrorMock.anError
    }
}
