//
//  ContentView.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI
import UIKit

// IOS
struct ContentView: View {
    
    // MARK: Private Properties
    @State private var showFavoritesOnly = false
    @State private var selectedTab: Tab = .featured
    
    // MARK: Constants
    
    // MARK: Types
    
    enum Tab {
        case featured
        case list
    }
    
    // MARK: Public Properties
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CategoryHome()
                .tag(Tab.featured)
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
            
            LandmarkList(
                showFavoritesOnly: $showFavoritesOnly,
                listBeginAppend: .init(Toggle("Favorites Only", isOn: $showFavoritesOnly))
            )
                .tag(Tab.list)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
        
    }
    
    // MARK: Public Functions
    
    init() {
//        UINavigationBar.appearance().backgroundColor = .systemGreen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .previewInterfaceOrientation(.portrait)
    }
}
