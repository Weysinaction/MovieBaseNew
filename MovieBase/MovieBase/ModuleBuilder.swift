// ModuleBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}

/// ModuleBuilder-
final class ModuleBuilder: Builder {
    static func createMain() -> UIViewController {
        let model = FilmRequestModel(page: nil, results: nil)
        let view = CategoryViewController()
        let presenter = CategoryPresenter(view: view, filmModel: model)
        view.presenter = presenter

        return view
    }
}
