import XCTest
import Infra
import Data
import Domain

class AddAccountIntegrationTests: XCTestCase {
    func test_add_account() {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://fordevs.herokuapp.com/api/signup")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Marlon Belo Marques", email: "marlon.belo.marques@gmail.com", password: "123", passwordConfirmation: "123")
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure: XCTFail("Expect success got \(result) instead")
            case .success(let account):
                XCTAssertNotNil(account.accessToken)
                XCTAssertEqual(account.name, addAccountModel.name)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
