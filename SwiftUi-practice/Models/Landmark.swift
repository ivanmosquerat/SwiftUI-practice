//
//  Landmark.swift
//  SwiftUi-practice
//
//  Created by Ivan Mosquera on 5/12/20.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featuredImage: Image?{
        isFeatured ? Image(imageName + "_feature") : nil
    }
}


struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
