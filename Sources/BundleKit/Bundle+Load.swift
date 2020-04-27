import Foundation

extension Bundle {
    /// Load a bundle from the Bundle's resource path.
    /// Intended for use with the `Bundle.main` as most bundles don't have a resourcePath.
    ///
    /// - Parameter name: bundle name with or without .bundle suffix
    /// - Throws: Bundle.Error
    /// - Returns: The loaded bundle when found
    public func bundleFromResources(name: String) throws -> Bundle {
        let bundleName: String
        if !name.hasSuffix(".bundle") {
            bundleName = name + ".bundle"
        } else {
            bundleName = name
        }

        guard let resourcePath = self.resourcePath else {
            throw Bundle.Error.bundleHasNoResourcePath
        }
        guard let bundle = Bundle(path: resourcePath + "/\(bundleName)") else {
            throw Bundle.Error.bundleNotFound(name: name)
        }
        return bundle
    }
}
