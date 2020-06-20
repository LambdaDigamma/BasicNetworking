# BasicNetworking

![Swift 5.0](https://img.shields.io/badge/Swift-5.1-blue.svg?style=flat)
[![Platform support](https://img.shields.io/badge/platform-ios%20%7C%20osx%20%7C%20tvos%20%7C%20watchos-lightgrey.svg?style=flat-square)](https://github.com/LambdaDigamma/BasicNetworking/blob/master/LICENSE.md)
![Swift](https://github.com/LambdaDigamma/BasicNetworking/workflows/Swift/badge.svg) 

> This Package enables you to write easy request based networking code. 
> Designed and developed for PHP Laravel backend services but works with every backend.
> Heavily inspired by Ben Scheirman take on networking in [Swift for Good](https://www.swiftforgood.com).

## Features

- [x] Basic Requests (GET, POST, PUT, DELETE)
- [ ] Authorization with Laravel Passport
- [ ] Authorization with Laravel Sanctum
- [ ] Support for Laravel API Paging 

## Requirements

- iOS 12.0+
- Xcode 11.0

## Installation

BasicNetworking is distributed using the [Swift Package Manager](https://swift.org/package-manager). To install it into a project, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/lambdadigamma/basicnetworking.git", from: "0.1.0")
    ],
    ...
)
```

Then import BasicNetworking wherever you’d like to use it:

```swift
import BasicNetworking
```

## Usage example

```swift
import BasicNetworking

public struct YourAPI {
    // all endpoints will be based on this
    public static let baseURL = URL(string: "https://example.org")!

    public static var api: APIClient = {
        let configuration = URLSessionConfiguration.default
        return APIClient(configuration: configuration)
    }()
}

```
