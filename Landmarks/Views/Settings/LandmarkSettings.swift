//
//  LandmarkSettings.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 28.04.2022.
//

import SwiftUI

struct LandmarkSettings: View {
    
    // MARK: Private Properties
    
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    // MARK: Public Properties
    
    var body: some View {
        Form {
            Picker("Map Zoom", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
    
}

struct LandmarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
