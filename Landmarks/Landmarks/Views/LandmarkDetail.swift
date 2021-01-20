//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Felipe Díaz on 28/12/20.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height:300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(landmark.park)
                            .multilineTextAlignment(.trailing)

                        Text(landmark.state)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
            
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
