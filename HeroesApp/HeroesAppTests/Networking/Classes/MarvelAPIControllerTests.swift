//
//  MarvelAPIControllerSpec.swift
//  HeroesAppTests
//
//  Created by Diogo Moreira on 11/12/20.
//

import Quick
import Nimble

@testable import HeroesApp

class MarvelAPIControllerSpec: QuickSpec {
    override func spec() {
        describe(".MarvelAPIControllerSpec") {

            var sut: MarvelAPIController!

            beforeEach {
               //sut = MarvelAPIController(provider: MoyaProvider<MarvelService>(stubClosure: MoyaProvider.immediatelyStub))
                //sut = MarvelAPIController
                sut = MarvelAPIController()
            }

            it("") {
//                let result = sut.sum(10, 20)
//
//                expect(result).to(be(30))
            }
        }
    }
}
