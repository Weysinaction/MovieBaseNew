// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    var filmTableView: UITableView { get set }
}

protocol MainViewPresenterProtocol: AnyObject {
    var filmsArray: [Film] { get set }
    func getDataFromServer()
}

/// CategoryPresenter-
final class CategoryPresenter: MainViewPresenterProtocol {
    // MARK: public properties

    var filmsArray: [Film] = []

    // MARK: private properties

    private weak var view: MainViewProtocol?
    private var filmModel: FilmRequestModel?
    private let apiURL = "https://api.themoviedb.org/3/movie/popular?api_key=23df17499c6157c62e263dc10faac033"

    // MARK: init

    init(view: MainViewProtocol, filmModel: FilmRequestModel) {
        self.view = view
        self.filmModel = filmModel
    }

    // MARK: internal methods

    internal func getDataFromServer() {
        guard let url =
            URL(string: apiURL)
        else { return }

        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let response = response, let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let filmRequestModel = try decoder.decode(FilmRequestModel.self, from: data)

                guard let films = filmRequestModel.results else { return }
                self.filmsArray = films

                DispatchQueue.main.async {
                    guard let tableView = self.view?.filmTableView else { return }
                    tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
