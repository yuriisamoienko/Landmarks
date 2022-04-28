//
//  ContentView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Yurii Samoienko on 26.04.2022.
//

import SwiftUI

// watch
struct ContentView: View {
    
    @State private var showFavoritesOnly = false
    
    var body: some View {
        LandmarkList(
            showFavoritesOnly: $showFavoritesOnly,
            listBeginAppend: {
                Toggle("Favorites Only", isOn: $showFavoritesOnly).toAnyView()
            }()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
