//
//  ContentView.swift
//  HiroFit
//
//  Created by Paul Kratsios on 7/17/22.
//

import SwiftUI

struct logo: View {
    let logoColor = Color(red: 19, green: 150, blue: 211)
    let hiro = "Hiro"
    var body: some View {
        Text(hiro)
    }
}

struct ContentView: View {
    var body: some View {
        StartWorkoutView()
    }
}

struct ContentView_Previews: PreviewProvider {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .title1), size: 30) ]
    }

    static var previews: some View {
        ContentView()
    }
}
