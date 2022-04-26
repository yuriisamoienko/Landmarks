//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 24.04.2022.
//

import SwiftUI
import CoreGraphics

struct CategoryHome: View {
    
    // MARK: Private Properties
    
    @EnvironmentObject private var modelData: ModelData
    @State private var showingProfile = false
    
    // MARK: Public Properties
    
    var body: some View {
        NavigationView {
            List {
                let pages = ModelData().features.map { FeatureCard(landmark: $0) }
                
                PageView(pages: pages)
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                
                let categories = modelData.categories
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: categories[key] ?? [])
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
        .navigationViewStyle(.stack) // fixes "unable sutisfy constraints"
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
