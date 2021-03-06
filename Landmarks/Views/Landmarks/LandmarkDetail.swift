//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI

struct LandmarkDetail: View {
    
    // MARK: Private Constants
    
    private let circleTopOffset: CGFloat = -130
    
    // MARK: Private Properties
    
    @EnvironmentObject private var modelData: ModelData
    
    private var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    // MARK: Public Properties
    
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                CircleView(image: landmark.image)
                    .offset(y: circleTopOffset)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: circleTopOffset, trailing: 0))
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        
                        Spacer()
                        
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    
                    HStack {
                        Text(landmark.park)
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text(landmark.state)
                            .font(.subheadline)
                    }
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    
                    Divider()
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    
                    Text(landmark.description)
                    //                    .fixedSize(horizontal: false, vertical: true)
                }.padding()
                
                Spacer()
                
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    private static let landmarks = ModelData().landmarks
    
    static var previews: some View {
        LandmarkDetail(landmark: Self.landmarks[3])
            .environmentObject(ModelData())
    }
}
