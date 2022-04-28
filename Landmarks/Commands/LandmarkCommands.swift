//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 28.04.2022.
//

import SwiftUI

// Macx and iOS
struct LandmarkCommands: Commands {
    
    // MARK: Public Properties
    
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            let buttonTitle = selectedLandmark?.isFavorite == true ? "Remove" : "Mark"
            Button(buttonTitle) {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
    
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get {
            self[SelectedLandmarkKey.self]
        }
        set {
            self[SelectedLandmarkKey.self] = newValue
        }
    }
}
