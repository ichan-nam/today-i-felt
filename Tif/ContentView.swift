//
//  ContentView.swift
//  Tif
//
//  Created by ICHAN NAM on 2022/04/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WritingView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }
            ReadingView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
