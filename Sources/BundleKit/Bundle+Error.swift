import Foundation

extension Bundle {
    public enum Error: Swift.Error {
        case bundleHasNoResourcePath
        case bundleNotFound(name: String)
        case resourceNotFound(bundle: Bundle, file: String)
        case couldNotReadDataFrom(bundle: Bundle, file: String)
        case jsonDecoding(error: DecodingError)
        case other(error: Swift.Error)
    }
}
