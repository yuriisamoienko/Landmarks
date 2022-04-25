//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 25.04.2022.
//

import SwiftUI

struct ProfileEditor: View {
    
    // MARK: Private Properties
    
    private var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    // MARK: Public Properties
    
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                
                Divider()
                
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable notifications")
                    .bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                let title = "Seasonal photo"
                
                Text(title)
                    .bold()
                
                Picker(title, selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { photo in
                        Text(photo.rawValue)
                            .tag(photo)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal date")
                    .bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
