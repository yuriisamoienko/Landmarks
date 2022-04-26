//
//  PageControl.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 26.04.2022.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    
    
    // MARK: Types
    
    typealias UIViewType = UIPageControl
    
    class Coordinator: NSObject {
        
        // MARK: Public Properties
        
        var control: PageControl
        
        // MARK: Public Functions
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
    // MARK: Public Properties
    
    var numberOfPages: Int
    
    @Binding var currentPage: Int
    
    // MARK: Public Functions
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
                    context.coordinator,
                    action: #selector(Coordinator.updateCurrentPage(sender:)),
                    for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.numberOfPages = numberOfPages
        uiView.currentPage = currentPage
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
