//
//  JSONApiCharacters+Spec.swift
//  HeroesAppTests
//
//  Created by Diogo Moreira on 13/12/20.
//
import Quick
import Nimble
import Foundation
@testable import HeroesApp

final class JSONApiCharactersSpec: QuickSpec {
    override func spec() {
        describe(".JSONApiCharactersSpec") {
            describe("decode") {
                context("with success") {
                    it("mount thumbnail url properly") {
                        let decoder: NetworkingJSONDecoder = JSONDecoder()

                        let characters = try? JSONApiCharacters.decoded(by: decoder, from: Bundle.dataFromJSON("Characters"))

                        let urlString = characters?.data.results.first?.thumbnail.getUrl()?.absoluteString

                        expect(urlString).to(equal("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"))
                    }
                }
            }
        }
    }
}
