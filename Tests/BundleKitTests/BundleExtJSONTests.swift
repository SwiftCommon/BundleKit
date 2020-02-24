@testable import BundleKit
import Foundation
import XCTest

final class BundleExtJSONTests: XCTestCase {
    struct TestJson: Decodable, Equatable {
        let key: String
    }

    func testBundleJSONDecode() {
        let bundleUrl: URL =
            URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .appendingPathComponent("Resources")
                .appendingPathComponent("test.bundle")
        let bundle = Bundle(url: bundleUrl)

        let expected = TestJson(key: "value")
        XCTAssertEqual(expected, bundle?.decode(TestJson.self, from: "test.json"))
    }

    static var allTests = [
        ("testBundleJSONDecode", testBundleJSONDecode)
    ]
}
