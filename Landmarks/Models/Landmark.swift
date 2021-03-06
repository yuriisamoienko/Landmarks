//
//  Landmark.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    
    // MARK: Public Properties
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var image: Image {
        Image(imageName)
    }
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    // MARK: Types
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // MARK: Private Properties
    
    private var imageName: String
    private var coordinates: Coordinates
    
    // MARK: Identifiable
    
}
