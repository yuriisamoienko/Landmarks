//
//  CircleImage.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI

struct CircleView: View {
    
    // MARK: Public Properties
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
    
}

struct CircleView_Previews: PreviewProvider {
    
    static var previews: some View {
        CircleView(image: Image("turtlerock", bundle: .main))
    }
    
}
