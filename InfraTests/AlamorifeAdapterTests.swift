import XCTest
import Alamofire
import Data

class AlamorifeAdapter {
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    func post(to url: URL, with data: Data?) {
        session.request(url, method: .post, parameters: data?.toJson(), encoding: JSONEncoding.default).resume()
    }
}

class AlamorifeAdapterTests: XCTestCase {
    func test_post_should_make_request_with_valid_url_and_method() {
        let url = makeUrl()
        testRequest(url: url, data: makeValidData()) { request in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("POST", request.httpMethod)
            XCTAssertNotNil(request.httpBodyStream)
        }
    }
    
    func test_post_should__make_request_with_no_data() {
        testRequest(data: nil) { request in
            XCTAssertNil(request.httpBodyStream)
        }
    }
}

extension AlamorifeAdapterTests {
    func makeSut(file: StaticString = #filePath, line: UInt = #line) -> AlamorifeAdapter {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamorifeAdapter(session: session)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
    
    func testRequest(url: URL = makeUrl(), data: Data?, action: @escaping (URLRequest) -> Void) {
        let sut = makeSut()
        sut.post(to: url, with: data)
        let exp = expectation(description: "waiting")
        UrlProtocolStub.observeRequest() { request in
            action(request)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

class UrlProtocolStub: URLProtocol {
    static var emit: ((URLRequest) -> Void)?
    
    static func observeRequest(completion: @escaping (URLRequest) -> Void) {
        UrlProtocolStub.emit = completion
    }
    
    open class override func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    open class override func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    open override func startLoading() {
        UrlProtocolStub.emit?(request)
    }
    
    open override func stopLoading() {
    
    }
}
