//
//  LandmarkDetail.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Yurii Samoienko on 26.04.2022.
//

import SwiftUI
import SwiftUiExtension_WatchOS

struct LandmarkDetail: View {
    
    // MARK: Private Properties
    
    @EnvironmentObject private var modelData: ModelData
    
    private var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    // MARK: Public Properties
    
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            VStack {
                CircleView(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favoritie")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
//                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
                    .disabled(true)
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    
    // MARK: Public Properties
    
    static var previews: some View {
        let modelData = ModelData()
        let landmark = modelData.landmarks[0]
        
        return Group {
            LandmarkDetail(landmark: landmark)
            
            LandmarkDetail(landmark: landmark)
                .preview(device: .AppleWatchSeries5_44mm)
            
            LandmarkDetail(landmark: landmark)
                .preview(device: .AppleWatchSeries5_40mm)
        }
        .environmentObject(modelData)
    }
}

