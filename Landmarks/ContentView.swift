//
//  ContentView.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var str = "asfwef"
    
    // // MARK: Constants
    private let circleTopOffset: CGFloat = -130
    
    var body: some View {
        VStack(alignment: .center) {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleView()
                .offset(y: circleTopOffset)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: circleTopOffset, trailing: 0))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Turtle Rock")
                        .font(.title)
                    
                    Spacer()
                }
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("California")
                        .font(.subheadline)
                }
                .foregroundColor(.secondary)
                .font(.subheadline)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Descriptive text goes here.")
            }.padding()
            
            Spacer()
            
        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
