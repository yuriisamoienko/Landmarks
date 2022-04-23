//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI

struct LandmarkList: View {
    
    // MARK: Private Properties
    
    @EnvironmentObject private var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            showFavoritesOnly == false || landmark.isFavorite
        }
    }
    
    // MARK: Public Properties
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Favorites Only", isOn: $showFavoritesOnly)
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .foregroundColor(.primary)
                .navigationTitle("Landmarks")
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
