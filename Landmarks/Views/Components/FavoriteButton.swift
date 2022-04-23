//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 23.04.2022.
//

import SwiftUI

struct FavoriteButton: View {
    
    // MARK: Public Properties
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
