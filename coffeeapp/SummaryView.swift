//
//  SummaryView.swift
//  coffeeapp
//
//  Created by Rome on 11/7/24.
//

import SwiftUI

struct SummaryView: View {
    let customOrange = Color(hex: "FFA16F")
    @State private var showingNewBrew = false
    
    @State private var coffee = Coffee(
        name: "Kirinyaga - KB",
        roaster: "June Coffee Co.",
        origin: "Kenya",
        process: "Washed",
        roastLevel: "Medium Dark",
        notes: "White Grapefruit, Plum, Grape",
        profileX: 0.2,
        profileY: 0
    )
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    CoffeeSummaryCard(coffee: coffee)
                    EquipmentSection()
                    ProfileChart(x: $coffee.profileX, y: $coffee.profileY)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGray6))
            .navigationTitle("Summary")
            .navigationBarItems(trailing:
                Button(action: {
                    showingNewBrew.toggle() // Toggle the sheet presentation
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(customOrange)
                }
            )
        }
        .sheet(isPresented: $showingNewBrew) {
            NewBrewSheet()
                .presentationDetents([.large]) // Makes the sheet full screen
        }
    }
}
