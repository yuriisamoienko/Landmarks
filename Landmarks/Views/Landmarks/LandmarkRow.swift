//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI
import SwiftUiExtension

struct LandmarkRow: View {
    
    // MARK: Public Properties
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            
            if isMacOS == true {
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .bold()
                    Text(landmark.park)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            } else {
                Text(landmark.name)
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .if(isMacOS) { $0
            .padding(.vertical, 4)
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    private static let landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: Self.landmarks[0])
            LandmarkRow(landmark: Self.landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
