//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI
import SwiftUiExtension

struct LandmarkList: View {
    
    // MARK: Private Properties
    
    @EnvironmentObject private var modelData: ModelData
    
    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            showFavoritesOnly == false || landmark.isFavorite
        }
    }
    
    // MARK: Public Properties
    
    // for platrform specific staff, to avoid preprocessor macroses
    var listBeginAppend: AnyView?
    var listModifier: ViewClosureModifier.Effect?
    
    @Binding var showFavoritesOnly: Bool
    
    var body: some View {
        let navigationView = NavigationView {
            List {
                listBeginAppend?.doNothing()
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .foregroundColor(.primary)
                .navigationTitle("Landmarks")
            }
            .modifier(listModifier)
//            .if(isMacOS) { $0
//                .frame(minWidth: 300)
//                .toolbar {
//                    ToolbarItem {
////                        Menu {
////                            Toggle(isOn: $showFavoritesOnly) {
////                                Label("Favorites only", systemImage: "star.fill")
////                            }
////                        } label: {
////                            Label("Filter", systemImage: "slider.horizontal.3")
////                        }
//                    }
//                }
//            }
        }
#if os(iOS)
        return navigationView //.navigationViewStyle(.stack)
#else
        return navigationView
#endif
    }
    
    // MARK: Public Functions
    
    init(showFavoritesOnly val: Binding<Bool> = .constant(false), listBeginAppend: AnyView? = nil, listModifier: ViewClosureModifier.Effect? = nil) {
        self.listBeginAppend = listBeginAppend
        self.listModifier = listModifier
        self._showFavoritesOnly = val
    }
}

struct LandmarkList_Previews: PreviewProvider {
    
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}



