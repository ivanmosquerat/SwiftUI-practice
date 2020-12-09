//
//  MapView.swift
//  SwiftUi-practice
//
//  Created by Ivan Mosquera on 13/11/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var coordinate : CLLocationCoordinate2D
    
    // Create an MKMapView
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // Cingure the view and respond to changes.
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    
        // Width and heigth of a map region
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated:true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: ModelData().landmarks[0].locationCoordinate)
    }
}
