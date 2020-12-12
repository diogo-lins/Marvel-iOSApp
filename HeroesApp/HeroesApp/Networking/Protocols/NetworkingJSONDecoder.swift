//
//  NetworkingJSONDecoder.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 10/12/20.
//
import Foundation

protocol NetworkingJSONDecoder {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable
}

extension JSONDecoder: NetworkingJSONDecoder {}
