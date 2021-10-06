// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setupData()
}

protocol DetailViewPresenterProtocol: AnyObject {
    var film: Film? { get set }
    var networkService: ImageNetworkServiceProtocol! { get set }
}

/// DetailViewPresenter-
class DetailPresenter: DetailViewPresenterProtocol {
    //MARK: public properties
    var film: Film?
    weak var view: DetailViewProtocol!
    var networkService: ImageNetworkServiceProtocol!

    //MARK: init
    init(view: DetailViewProtocol, film: Film, networkService: ImageNetworkServiceProtocol) {
        self.view = view
        self.film = film
        self.networkService = networkService
    }
}
