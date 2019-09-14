//
//  InteractiveLandmarkRow.swift
//  my_swiftui_codelab
//
//  Created by Takuya Yokoyama on 2019/09/14.
//  Copyright © 2019 chocoyama. All rights reserved.
//

import SwiftUI

struct InteractiveLandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct InteractiveLandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InteractiveLandmarkRow(landmark: landmarkData[0])
            InteractiveLandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
