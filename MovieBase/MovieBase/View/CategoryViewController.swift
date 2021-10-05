// CategoryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// CategoryViewController-
final class CategoryViewController: UIViewController {
    // MARK: view elements

    private var tableView = UITableView()

    // MARK: private properties

    private let filmCellID = "FilmCell"
    private let apiURL = "https://api.themoviedb.org/3/movie/popular?api_key=23df17499c6157c62e263dc10faac033"

    // MARK: public properties

    var presenter: MainViewPresenterProtocol!

    // MARK: CategoryViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        presenter.getDataFromServer(url: apiURL)
    }

    // MARK: Private methods

    private func setupViewController() {
        view.backgroundColor = .red
        title = "Films"

        setupTableView()
    }

    private func setupTableView() {
        filmTableView = UITableView(frame: view.bounds, style: .plain)
        filmTableView.register(FilmTableViewCell.self, forCellReuseIdentifier: filmCellID)

        filmTableView.delegate = self
        filmTableView.dataSource = self
        view.addSubview(filmTableView)
        filmTableView.translatesAutoresizingMaskIntoConstraints = false
        filmTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        filmTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        filmTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        filmTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.filmsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = filmTableView
            .dequeueReusableCell(withIdentifier: filmCellID, for: indexPath) as? FilmTableViewCell
        else { return UITableViewCell() }

        cell.configureCell(filmsArray: presenter.filmsArray, indexPath: indexPath)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()

        let currentItem = indexPath.row
        guard let title = presenter.filmsArray[currentItem].originalTitle,
              let overview = presenter.filmsArray[currentItem].overview,
              let imagePath = presenter.filmsArray[currentItem].posterPath else { return }
        vc.filmTitle = title
        vc.filmDescription = overview
        vc.path = imagePath
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: MainViewProtocol

extension CategoryViewController: MainViewProtocol {
    var filmTableView: UITableView {
        get {
            tableView
        }
        set(newValue) {
            tableView = newValue
        }
    }
}
