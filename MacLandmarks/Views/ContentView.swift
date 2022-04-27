//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Yurii Samoienko on 26.04.2022.
//

import SwiftUI
import SwiftUiExtension

struct ContentView: View {
    
    // MARK: Private Properties
    @State private var showFavoritesOnly = false
    
    // MARK: Public Properties
    
    var body: some View {
        LandmarkList(
            showFavoritesOnly: $showFavoritesOnly,
            listModifier: { _ = $0
                .frame(minWidth: 300)
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Toggle(isOn: $showFavoritesOnly) {
                                Label("Favorites only", systemImage: "star.fill")
                            }
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
                }}
            )
        .frame(width: 700, height: 300)
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
