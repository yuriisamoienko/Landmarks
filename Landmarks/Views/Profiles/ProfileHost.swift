//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 25.04.2022.
//

import SwiftUI

struct ProfileHost: View {
    
    // MARK: Private Properties
    
    @State private var draftProfile = Profile.default
    @EnvironmentObject private var modelData: ModelData
    
    // MARK: Public Properties
    
    @Environment(\.editMode) var editMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        resetDraftProfile()
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profle)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        resetDraftProfile()
                    }
                    .onDisappear {
                        modelData.profle = draftProfile
                    }
            }
        }
        .padding()
    }
    
    // MARK: Private Functions
    
    private func resetDraftProfile() {
        draftProfile = modelData.profle
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
