//
//  ProfileHost.swift
//  SwiftUi-practice
//
//  Created by Ivan Mosquera on 2/1/21.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    
    // COPIA QUE SE LE PASA EL EDIT VIEW Y SE ASIGANA AL PROFILE UNA VEZ SE CONFIRMAN LOS CAMBIOS
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack{
                
                if editMode?.wrappedValue == .active{
                    Button("Cancel") {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
                    
            }else{
                
                // SE LE PASA LA COPIA AL PROFILE EDITOR.
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
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
