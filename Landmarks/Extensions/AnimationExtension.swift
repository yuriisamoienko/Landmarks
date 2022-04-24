//
//  AnimationExtension.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 24.04.2022.
//

import Foundation
import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

