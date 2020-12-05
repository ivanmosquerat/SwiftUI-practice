//
//  LandmarkList.swift
//  SwiftUi-practice
//
//  Created by Ivan Mosquera on 5/12/20.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        NavigationView {
            List(landmarkData){ landmark in
                
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
            
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone 12"], id: \.self){ deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}
