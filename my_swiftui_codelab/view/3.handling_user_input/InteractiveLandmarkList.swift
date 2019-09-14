//
//  InteractiveLandmarkList.swift
//  my_swiftui_codelab
//
//  Created by Takuya Yokoyama on 2019/09/14.
//  Copyright © 2019 chocoyama. All rights reserved.
//

import SwiftUI

struct InteractiveLandmarkList: View {
    @EnvironmentObject var userData: UserData
//    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List {
//                Toggle(isOn: $showFavoritesOnly) {
//                    Text("Favorites only")
//
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(
                            destination: InteractiveLandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ) {
                            InteractiveLandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct InteractiveLandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            InteractiveLandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
