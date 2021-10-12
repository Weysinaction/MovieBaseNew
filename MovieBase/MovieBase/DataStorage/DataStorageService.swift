// DataStorageService.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

protocol DataStorageServiceProtocol {
    func getFilms() -> [MoviesManagedObjects]?
    func addFilms(object: [Film])
    func deleteAllData(_ entity: String)
}

/// DataStorageService-
class DataStorageService: DataStorageServiceProtocol {
    // MARK: private properties

    private let repository = Repository(database: CoreDataStorage())

    // MARK: public methods

    func getFilms() -> [MoviesManagedObjects]? {
        repository.getFilms()
    }

    func addFilms(object: [Film]) {
        repository.addFilms(films: object)
    }

    func deleteAllData(_ entity: String) {
        repository.deleteAllData(entity)
    }
}
