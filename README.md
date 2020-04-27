# Bundle extensions for Apple's Foundation Bundle

![Swift 5.0+](https://img.shields.io/badge/Swift-5.0+-orange.svg)
[![license](https://img.shields.io/github/license/SwiftCommon/BundleKit.svg)](https://github.com/SwiftCommon/BundleKit/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/SwiftCommon/BundleKit.svg?branch=master)](https://travis-ci.org/SwiftCommon/BundleKit)
[![codecov](https://codecov.io/gh/SwiftCommon/BundleKit/branch/master/graph/badge.svg)](https://codecov.io/gh/SwiftCommon/BundleKit)

Nice little µframework for loading 'local' Bundle JSON resources. Could be extended for other file types.

Getting started
---------------

On first checkout you best run: `$ make setup` that will trigger the `scripts/setup` bash script to run
and check the required dependencies and generate the Xcodeproj.

Features
--------

### Load and parse a JSON resource from a Bundle

```swift
    let bundle = Bundle(url: bundleUrl)
    let json = bundle?.decode(ObjectType.self, from: "file.json")
```

Installation
------------

### Swift PM

Put this in your `Package.swift`:

```swift
    ...
    dependencies: [
       .package(url: "https://github.com/SwiftCommon/BundleKit", "0.0.1" ..< "1.0.0")
    ],
    targets: [
       .target(
          name: "YourAwesomeApp",
          dependencies: ["BundleKit"]
       )
    ]
```

License
-------

Licensed under the MIT license.
