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
        CircleView(image: landmark.image.resizable())
            .scaledToFill()
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    
    // MARK: Public Properties
    
    static var previews: some View {
        let modelData = ModelData()
        let landmark = modelData.landmarks[2]
        
        return Group {
            LandmarkDetail(landmark: landmark)
                .environmentObject(modelData)
            
            LandmarkDetail(landmark: landmark)
                .environmentObject(modelData)
                .preview(device: .AppleWatchSeries5_44mm)
            
            LandmarkDetail(landmark: landmark)
                .environmentObject(modelData)
                .preview(device: .AppleWatchSeries5_40mm)
        }
    }
}

