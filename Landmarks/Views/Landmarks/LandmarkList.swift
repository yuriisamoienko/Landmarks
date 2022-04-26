//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI
import SwiftUiExtension

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
        let navigationView = NavigationView {
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
            .if(isMacOS) { $0
                .frame(minWidth: 300)
            }
        }
#if os(OSX)
        return navigationView
#else
        return navigationView.navigationViewStyle(.stack)
#endif
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}



