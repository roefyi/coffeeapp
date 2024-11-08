//
//  EquipmentSection.swift
//  coffeeapp
//
//  Created by Rome on 11/7/24.
//

import SwiftUI

struct EquipmentSection: View {
    @State private var showingBrewerPopover = false
    @State private var showingGrinderPopover = false
    let customOrange = Color(hex: "FFA16F")
    
    @State private var selectedBrewer = "Lelit Anna PL41TEM"
    @State private var selectedGrinder = "Varia VS3"
    
    let brewers = ["Lelit Anna PL41TEM", "V60", "Chemex", "Aeropress"]
    let grinders = ["Varia VS3", "Niche Zero", "DF64", "Weber Key"]
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                // Brewer Row
                HStack {
                    Text("Brewer")
                    Spacer()
                    Button {
                        showingBrewerPopover = true
                    } label: {
                        HStack {
                            Text(selectedBrewer)
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundColor(.gray)
                                .imageScale(.small)
                        }
                    }
                    .popover(isPresented: $showingBrewerPopover) {
                        VStack(spacing: 0) {
                            ForEach(brewers, id: \.self) { brewer in
                                Button {
                                    selectedBrewer = brewer
                                    showingBrewerPopover = false
                                } label: {
                                    HStack {
                                        Text(brewer)
                                            .foregroundColor(.primary)
                                        Spacer()
                                        if selectedBrewer == brewer {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(customOrange)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .frame(height: 44)
                                }
                                if brewer != brewers.last {
                                    Divider()
                                }
                            }
                        }
                        .presentationCompactAdaptation(.popover)
                        .frame(width: 250)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                
                Divider()
                
                // Grinder Row
                HStack {
                    Text("Grinder")
                    Spacer()
                    Button {
                        showingGrinderPopover = true
                    } label: {
                        HStack {
                            Text(selectedGrinder)
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundColor(.gray)
                                .imageScale(.small)
                        }
                    }
                    .popover(isPresented: $showingGrinderPopover) {
                        VStack(spacing: 0) {
                            ForEach(grinders, id: \.self) { grinder in
                                Button {
                                    selectedGrinder = grinder
                                    showingGrinderPopover = false
                                } label: {
                                    HStack {
                                        Text(grinder)
                                            .foregroundColor(.primary)
                                        Spacer()
                                        if selectedGrinder == grinder {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(customOrange)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .frame(height: 44)
                                }
                                if grinder != grinders.last {
                                    Divider()
                                }
                            }
                        }
                        .presentationCompactAdaptation(.popover)
                        .frame(width: 250)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(8)
    }
}

#Preview {
    EquipmentSection()
        .padding()
        .background(Color(.systemGray6))
}
