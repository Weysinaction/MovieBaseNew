// AssemblyModelBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController
    func createDetail(router: RouterProtocol, film: Film) -> UIViewController
}

/// ModuleBuilder-
final class AssemblyModelBuilder: AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController {
        let movieAPIService = MovieAPIService()
        let view = CategoryViewController()
        let presenter = CategoryPresenter(view: view, movieAPIService: movieAPIService, router: router)
        view.presenter = presenter

        return view
    }

    func createDetail(router: RouterProtocol, film: Film) -> UIViewController {
        let networkService = ImageNetworkService()
        let view = ViewController()
        let presenter = DetailPresenter(view: view, film: film, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }
}
