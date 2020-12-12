//
//  MarvelService+Spec.swift
//  HeroesAppTests
//
//  Created by Diogo Moreira on 12/12/20.
//

import Foundation

import Quick
import Nimble
import Foundation
@testable import HeroesApp
import Moya

final class MarvelServiceSpec: QuickSpec {
    override func spec() {
        describe(".MarvelServiceSpec") {
            var sut: MoyaProvider<MarvelService>!

            beforeEach {
                sut = MoyaProvider<MarvelService>(stubClosure: MoyaProvider.immediatelyStub)
            }

            context("with success") {
                it("should returns stubbed data for user media request") {
                    var json: String?

                    let target: MarvelService = .getCharacters(limit: 5, offset: 0)
                    sut.request(target) { result in
                        if case let .success(response) = result {
                            json = String(data: response.data, encoding: .utf8)
                        }
                    }
                    let sampleData = String(data: target.sampleData, encoding: .utf8)
                    
                    expect(json).to(equal(sampleData))
                }
            }
        }
    }
}
