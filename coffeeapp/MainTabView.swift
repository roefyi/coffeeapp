//
//  MainTabView.swift
//  coffeeapp
//
//  Created by Rome on 11/7/24.
//

import SwiftUI

struct MainTabView: View {
    let customOrange = Color(hex: "FFA16F")
    
    var body: some View {
        TabView {
            SummaryView()
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("Summary")
                }
            
            ShelfView()
                .tabItem {
                    Image(systemName: "square.stack")
                    Text("Shelf")
                }
            
            BrewsView()
                .tabItem {
                    Image(systemName: "drop")
                    Text("Brews")
                }
        }
        .accentColor(customOrange) // This sets the selected tab color
        .onAppear {
            // Set tab bar background color
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor.systemGray6
            
            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance    }
        }
    }
}
