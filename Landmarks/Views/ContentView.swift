//
//  ContentView.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 22.04.2022.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    // // MARK: Constants
    
    // MARK: Public Properties
    
    var body: some View {
        LandmarkList()
    }
    
    // MARK: Public Functions
    
    init() {
//        UINavigationBar.appearance().backgroundColor = .systemGreen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
