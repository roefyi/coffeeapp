//
//  CoffeeSummaryCard.swift
//  coffeeapp
//
//  Created by Rome on 11/7/24.
//

import SwiftUI

struct CoffeeSummaryCard: View {
    let coffee: Coffee
    let customOrange = Color(hex: "FFA16F")
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                // Labels Column
                VStack(alignment: .trailing, spacing: 10) {
                    Text("Coffee")
                    Text("Roaster")
                    Text("Origin")
                    Text("Process")
                    Text("Roast Level")
                    Text("Notes")
                }
                .foregroundColor(.gray)
                .frame(width: 80)
                
                // Divider
                Rectangle()
                    .fill(Color(.gray))
                    .frame(width: 2)
                    .padding(.horizontal, 8)
                
                // Values Column
                VStack(alignment: .leading, spacing: 10) {
                    Text(coffee.name)
                    Text(coffee.roaster)
                    Text(coffee.origin)
                    Text(coffee.process)
                    Text(coffee.roastLevel)
                    Text(coffee.notes)
                }
                .foregroundColor(customOrange)
                
                Spacer()
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .fontWeight(.semibold)
        .font(.system(size: 14))
    }
}

// Add this extension to support hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
