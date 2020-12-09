//
//  LandmarkRow.swift
//  SwiftUi-practice
//
//  Created by Ivan Mosquera on 5/12/20.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite{
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmark = ModelData().landmarks
    
    static var previews: some View {
        Group{
            LandmarkRow(landmark: landmark[0])
            LandmarkRow(landmark: landmark[1])
            LandmarkRow(landmark: landmark[2])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
