//
//  ModelData.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    
    @Published var landmarks: [Landmark] = loadJson("landmarkData.json")
    @Published var profle: Profile = .default
    
    var hikes: [Hike] = loadJson("hikeData.json")
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features: [Landmark] {
        landmarks.filter {
            $0.isFeatured
        }
    }
}

fileprivate func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
