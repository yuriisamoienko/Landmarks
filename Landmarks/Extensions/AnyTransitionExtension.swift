//
//  AnyTransitionExtension.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 24.04.2022.
//

import SwiftUI

extension AnyTransition {
    
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
    
}
