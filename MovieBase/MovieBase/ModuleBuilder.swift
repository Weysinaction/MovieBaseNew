// ModuleBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}

/// ModuleBuilder-
final class ModuleBuilder: Builder {
    static func createMain() -> UIViewController {
        let movieAPIService = MovieAPIService()
        let view = CategoryViewController()
        let presenter = CategoryPresenter(view: view, movieAPIService: movieAPIService)
        view.presenter = presenter

        return view
    }

    static func createDetail(film: Film) -> UIViewController {
        let networkService = ImageNetworkService()
        let view = ViewController()
        let presenter = DetailPresenter(view: view, film: film, networkService: networkService)
        view.presenter = presenter

        return view
    }
}
