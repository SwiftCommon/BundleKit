import Foundation

extension Bundle {
    /// Decode a JSON resource from a Bundle
    ///
    /// - Parameters:
    ///   - type: the expected return type to parse the JSON structure onto
    ///   - file: the resource filename inside the bundle
    ///   - dateDecodingStrategy: the date decoding strategy. Default: `.deferredToDate`
    ///   - keyDecodingStrategy: the key decoding strategy. Default: `.useDefaultKeys`
    /// - Throws: Bundle.Error if the resource is malformed or not found in the bundle
    /// - Returns: the JSON parsed structure
    public func decode<T: Decodable>(
        _ type: T.Type, from file: String,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys
    ) throws -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            throw Bundle.Error.resourceNotFound(bundle: self, file: file)
        }

        guard let data = try? Data(contentsOf: url) else {
            throw Bundle.Error.couldNotReadDataFrom(bundle: self, file: file)
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            if let error = error as? DecodingError {
                throw Bundle.Error.jsonDecoding(error: error)
            } else {
                throw Bundle.Error.other(error: error)
            }
        }
    }
}
