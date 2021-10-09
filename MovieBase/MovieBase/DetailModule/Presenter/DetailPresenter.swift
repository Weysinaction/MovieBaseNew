// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setupData()
}

protocol DetailViewPresenterProtocol: AnyObject {
    var film: Film? { get set }
    var networkService: ImageNetworkServiceProtocol! { get set }
    func tap()
}

/// DetailViewPresenter-
final class DetailPresenter: DetailViewPresenterProtocol {
    // MARK: public properties

    var film: Film?
    private weak var view: DetailViewProtocol?
    internal var networkService: ImageNetworkServiceProtocol!
    private var router: RouterProtocol?

    // MARK: init

    init(view: DetailViewProtocol, film: Film, networkService: ImageNetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.film = film
        self.networkService = networkService
        self.router = router
    }

    func tap() {
        router?.popToRoot()
    }
}
