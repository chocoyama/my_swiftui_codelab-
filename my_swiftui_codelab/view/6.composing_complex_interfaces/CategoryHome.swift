//
//  Home.swift
//  my_swiftui_codelab
//
//  Created by Takuya Yokoyama on 2019/09/14.
//  Copyright © 2019 chocoyama. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(
                    destination: InteractiveLandmarkList()
                ) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
