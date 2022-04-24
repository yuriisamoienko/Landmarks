//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 24.04.2022.
//

import SwiftUI

struct CategoryRow: View {
    
    // MARK: Public Properties
    
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { item in
                        NavigationLink {
                            LandmarkDetail(landmark: item)
                        } label: {
                            CategoryItem(landmark: item)
                        }
                    }
                }
            }
        }
    }
    
}

struct CategoryRow_Previews: PreviewProvider {
    
    // MARK: Private Properties
    
    private static var landmarks = ModelData().landmarks
    
    // MARK: Public Properties
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(3))
        )
    }
    
}
