//
//  NotificationView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Yurii Samoienko on 26.04.2022.
//

import SwiftUI

struct NotificationView: View {
    
    // MARK: Public Properties
    
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if let landmark = landmark {
                CircleView(image: landmark.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Uknown landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of your favorite landmark")
                .font(.caption)
        }
    }
    
}

struct NotificationView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            NotificationView()
            
            NotificationView(
                title: "Turtle Rock",
                message: "You are within 5 miles of Turtle Rock",
                landmark: ModelData().landmarks[0]
            )
        }
    }
    
}
