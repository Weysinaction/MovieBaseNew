// MovieBaseService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol MovieBaseServiceProtocol {
    func getMovies(completion: @escaping (Result<[Film]?, Error>) -> Void)
}
