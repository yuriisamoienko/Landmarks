//
//  Badge.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 24.04.2022.
//

import SwiftUI

struct Badge: View {
    
    // MARK: Private Properties
    
    private let badgeSymbolsCount: Int = 10
    
    private var badgeSymbols: some View {
        return ForEach(0..<badgeSymbolsCount) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(badgeSymbolsCount)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    // MARK: Public Properties
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
