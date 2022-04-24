//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 24.04.2022.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    // MARK: Public Properties
    
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
    
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 15))
    }
}
