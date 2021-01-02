//
//  ProfileHost.swift
//  SwiftUi-practice
//
//  Created by Ivan Mosquera on 2/1/21.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMore
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack{
                Spacer()
                EditButton()
            }
            
            ProfileSummary(profile: modelData.profile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
