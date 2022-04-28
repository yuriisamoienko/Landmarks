//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI
import SwiftUiExtension

struct LandmarkList: View {
    
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }
    
    // MARK: Private Properties
    @EnvironmentObject private var modelData: ModelData
    @State private var selectedLandmark: Landmark?
    
    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (showFavoritesOnly == false || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    // MARK: Public Properties
    
    // for platrform specific staff, to avoid preprocessor macroses
    var listBeginAppend: AnyView?
    var listModifier: ViewClosureModifier.Effect?
    var navigationViewEndAppend: AnyView?
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }

    
    @Binding var showFavoritesOnly: Bool
    @Binding var filter: FilterCategory
    
    
    var body: some View {
        NavigationView {
            List(selection: $selectedLandmark) {
                listBeginAppend?.doNothing()
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
                .foregroundColor(.primary)
            }
            .navigationTitle(title)
            .modifier(listModifier)
            
            navigationViewEndAppend?.doNothing()
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
    
    // MARK: Public Functions
    
    init(
        showFavoritesOnly: Binding<Bool> = .constant(false),
        filter: Binding<FilterCategory> = .constant(.all),
        listBeginAppend: AnyView? = nil,
        listModifier: ViewClosureModifier.Effect? = nil,
        navigationViewEndAppend: AnyView? = nil
    ) {
        self.listBeginAppend = listBeginAppend
        self.listModifier = listModifier
        self.navigationViewEndAppend = navigationViewEndAppend
        self._showFavoritesOnly = showFavoritesOnly
        self._filter = filter
    }
}

struct LandmarkList_Previews: PreviewProvider {
    
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}



