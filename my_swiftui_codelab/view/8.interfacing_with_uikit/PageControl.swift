//
//  PageControl.swift
//  my_swiftui_codelab
//
//  Created by Takuya Yokoyama on 2019/09/15.
//  Copyright © 2019 chocoyama. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    typealias UIViewType = UIPageControl
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> PageControl.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> PageControl.UIViewType {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator,
                          action: #selector(Coordinator.updateCurrentPage(sender:)),
                          for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: PageControl.UIViewType, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

