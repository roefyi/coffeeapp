//
//  ProfileChart.swift
//  coffeeapp
//
//  Created by Rome on 11/7/24.
//

import SwiftUI

struct ProfileChart: View {
    @Binding var x: Double
    @Binding var y: Double
    let customOrange = Color(hex: "FFA16F")
    
    let labels = [
        "Intense",
        "Bitter",
        "Weak",
        "Sour"
    ]
    
    var body: some View {
        VStack {
            ZStack {
                // Background
                VStack {
                    Spacer()
                }
                
                HStack {
                    Spacer()

                }
                
                // Labels
                VStack {
                    Text(labels[0])
                        .font(.caption)
                    Spacer()
                    Text(labels[2])
                        .font(.caption)
                }
                
                HStack {
                    Text(labels[3])
                        .font(.caption)
                        .rotationEffect(.degrees(-90))
                    Spacer()
                    Text(labels[1])
                        .font(.caption)
                        .rotationEffect(.degrees(90))
                }
                
                // Draggable Circle
                Circle()
                    .fill(customOrange)
                    .frame(width: 20, height: 20)
                    .position(
                        x: (UIScreen.main.bounds.width - 40) * (x + 1) / 2,
                        y: (UIScreen.main.bounds.width - 40) * (-y + 1) / 2
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let bounds = UIScreen.main.bounds.width - 40
                                let newX = (value.location.x / bounds) * 2 - 1
                                let newY = -((value.location.y / bounds) * 2 - 1)
                                
                                x = min(1, max(-1, newX))
                                y = min(1, max(-1, newY))
                            }
                    )
            }
            .frame(height: UIScreen.main.bounds.width - 40)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .fontWeight(.semibold)
    }
}
