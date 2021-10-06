// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    var filmTableView: UITableView { get set }
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    var filmsArray: [Film]? { get set }
    func getMovies()
}

/// CategoryPresenter-
final class CategoryPresenter: MainViewPresenterProtocol {
    // MARK: public properties

    var filmsArray: [Film]? = []

    // MARK: private properties

    private weak var view: MainViewProtocol?
    private var filmModel: FilmRequestModel?
    private let networkService: NetworkServiceProtocol!
    private let apiURL = "https://api.themoviedb.org/3/movie/popular?api_key=23df17499c6157c62e263dc10faac033"

    // MARK: init

    init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }

    func getMovies() {
        networkService.getMovies { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case let .success(films):
                    self.filmsArray = films
                    self.view?.success()
                case let .failure(error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
