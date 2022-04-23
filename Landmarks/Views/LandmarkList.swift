//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .foregroundColor(.primary)
            .navigationTitle("Landmarks")
        }
        .navigationViewStyle(.stack)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone 8", "iPhone 12"], id: \.self) { deviceName in
                LandmarkList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
//            LandmarkList()
//                .previewDevice("iPhone 8")
            
            LandmarkList()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 12 mini")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
