//
//  ContentView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Yurii Samoienko on 26.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
