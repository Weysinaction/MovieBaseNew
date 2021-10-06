//
//  MovieBaseService.swift
//  MovieBase
//
//  Created by Владислав Лазарев on 06.10.2021.
//

import Foundation

protocol MovieBaseServiceProtocol {
    func getMovies(completion: @escaping (Result<[Film]?, Error>) -> Void)
}




