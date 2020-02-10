@testable import NetworkPackage
import XCTest
//
// fileprivate enum Endpoint:RequestBuilder{
//    case login
//
// }

final class NetworkPackageTests: XCTestCase {
    func testExample() {
        let result: Result<BasicRespone, Error> = HTTPClient().getModel(of: XEndpoint.login)
        switch result {
        case let .success(response):
            print(response)
        case let .failure(err):
            print(err)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
