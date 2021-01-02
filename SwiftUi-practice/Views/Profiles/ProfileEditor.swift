//
//  ProfileEditor.swift
//  SwiftUi-practice
//
//  Created by Ivan Mosquera on 2/1/21.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
        
        List{
            HStack{
                Text("Userame").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enabled notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20){
                Text("Seasonal photo").bold()
                
                Picker("Seasonal photo",selection: $profile.seasonalPhoto){
                    
                    ForEach(Profile.Season.allCases){ season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date){
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
