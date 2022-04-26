//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI
import MapKit

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
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleView(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    private static let landmarks = ModelData().landmarks
    
    static var previews: some View {
        LandmarkDetail(landmark: Self.landmarks[3])
            .environmentObject(ModelData())
    }
}
