//
//  UserData.swift
//  my_swiftui_codelab
//
//  Created by Takuya Yokoyama on 2019/09/14.
//  Copyright © 2019 chocoyama. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
