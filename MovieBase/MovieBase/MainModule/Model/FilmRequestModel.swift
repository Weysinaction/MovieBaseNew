// FilmRequestModel.swift

import Foundation

/// FilmRequestModel-
struct FilmRequestModel: Decodable {
    let page: Int?
    let results: [Film]?
}
