//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Yurii Samoienko on 26.04.2022.
//

import SwiftUI
import SwiftUiExtension

// Mac
struct ContentView: View {
    
    // MARK: Private Properties
    @State private var showFavoritesOnly = false
    @State private var filter: LandmarkList.FilterCategory = .all
    
    // MARK: Public Properties
    
    var body: some View {
        LandmarkList(
            showFavoritesOnly: $showFavoritesOnly,
            filter: $filter,
            listModifier: { AnyView($0
                    .frame(minWidth: 300)
                    .frame(width: 300)
                    .toolbar {
                        ToolbarItem {
                            Menu {
                                Picker("Category", selection: $filter) {
                                    ForEach(LandmarkList.FilterCategory.allCases) { category in
                                        Text(category.rawValue).tag(category)
                                    }
                                }
                                .pickerStyle(.inline)
                                
                                Toggle(isOn: $showFavoritesOnly) {
                                    Label("Favorites only", systemImage: "star.fill")
                                }
                            } label: {
                                Label("Filter", systemImage: "slider.horizontal.3")
                            }
                        }
                    }
            )},
            navigationViewEndAppend: AnyView(
                Text("Select a Landmark")
            )
        )
        .frame(width: 900, height: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
