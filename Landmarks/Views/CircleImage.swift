//
//  CircleImage.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI

struct CircleView: View {
    
    var body: some View {
        Image("turtlerock", bundle: .main)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
    
}

struct CircleView_Previews: PreviewProvider {
    
    static var previews: some View {
        CircleView()
    }
    
}
