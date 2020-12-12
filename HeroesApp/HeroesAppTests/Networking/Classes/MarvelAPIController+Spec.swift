import Quick
import Nimble
import Foundation
@testable import HeroesApp
import Moya

final class MarvelAPIControllerSpec: QuickSpec {
    override func spec() {
        describe(".MarvelAPIControllerSpec") {
            var sut: MarvelAPIController!

            beforeEach {
                sut = MarvelAPIController(provider: MoyaProvider<MarvelService>(stubClosure: MoyaProvider.immediatelyStub))
            }

            context("with success") {
                it("should returns a JSONApiCharacters on completion from API") {
                    var receivedMappedObject: JSONApiCharacters?

                    sut.getCharacters(limit: 1, offset: 10) { result in
                        if case .success(let characters) = result {
                            receivedMappedObject = characters
                        }

                        expect(receivedMappedObject?.data.results.count).to(equal(5))
                        expect(receivedMappedObject?.data.results.first?.id).to(equal(1011334))
                        expect(receivedMappedObject?.data.results.first?.name).to(equal("3-D Man"))
                    }
                }
            }

            context("with API error") {
                it("should returns a error to try decode data") {
                    let customEndpointClosure = { (target: MarvelService) -> Endpoint in
                        return Endpoint(url: URL(target: target).absoluteString,
                                        sampleResponseClosure: { .networkResponse(401 , Data()) },
                                        method: target.method,
                                        task: target.task,
                                        httpHeaderFields: target.headers)
                    }

                    sut = MarvelAPIController(provider: MoyaProvider<MarvelService>(endpointClosure: customEndpointClosure, stubClosure: MoyaProvider.immediatelyStub))

                    var receivedError: Error?

                    sut.getCharacters(limit: 1, offset: 10) { result in
                        if case .failure(let error) = result {
                            receivedError = error
                        }
                    }

                    expect(receivedError).toNot(beNil())
                    expect(receivedError).to(matchError(APIError.unableToDecodeData))
                }

            }
        }
    }
}
