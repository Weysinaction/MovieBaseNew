// ImageNetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol ImageNetworkServiceProtocol {
    func getImageFromPath(path: String) -> Data
}

/// ImageNetworkService-
class ImageNetworkService: ImageNetworkServiceProtocol {
    // MARK: private properties

    private var url = "https://image.tmdb.org/t/p/w500"

    // MARK: internal methods

    internal func getImageFromPath(path: String) -> Data {
        guard let imageURL = URL(string: "\(url)\(path)"),
              let imageData = try? Data(contentsOf: imageURL) else { return Data() }

        return imageData
    }
}
