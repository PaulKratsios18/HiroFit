//
//  HiroFitApp.swift
//  HiroFit
//
//  Created by Paul Kratsios on 7/1/Users/paulkratsios/CodeProjects/HiroFit/HiroFit/HiroFit/ContentView.swift7/22.
//

import SwiftUI

@main
struct HiroFitApp: App {
    
    class NavigationHelper: ObservableObject {
        @Published var selection: String? = nil
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(NavigationHelper())
        }
    }
}


