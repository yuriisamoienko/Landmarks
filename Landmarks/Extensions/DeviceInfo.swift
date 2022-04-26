//
//  UIDeviceExtension.swift
//  Landmarks
//
//  Created by Yurii Samoienko on 26.04.2022.
//

import Foundation

struct DeviceInfo {
        
    enum SystemPlatform {
        case unknown
        case iOS
        case watchOS
        case macOS
        case tvOS
    }
    
    var systemPlatform: SystemPlatform {
#if os(OSX)
        .macOS
#elseif os(watchOS)
        .watchOS
#elseif os(tvOS)
        .tvOS
#elseif os(iOS)
    #if targetEnvironment(macCatalyst)
        .macOS
    #else
        .iOS
    #endif
#else
        .unknown
#endif
    }
}
