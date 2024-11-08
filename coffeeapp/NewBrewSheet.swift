//
//  NewBrewSheet.swift
//  coffeeapp
//
//  Created by Rome on 11/7/24.
//

import SwiftUI
import Combine

struct NewBrewSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var brewParams = BrewParameters()
    @State private var showingDatePicker = false
    @FocusState private var focusedField: Field?
    let customOrange = Color(hex: "FFA16F")
    
    // Popover states
    @State private var showingGrinderPopover = false
    @State private var showingMilkPopover = false
    @State private var showingPrepPopover = false
    
    // Focus management for text fields
    enum Field {
        case dose, grindSetting, temperature, time, yield, notes
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Date and Basic Info Section
                Section {
                    HStack {
                        Text("Date")
                        Spacer()
                        Text(brewParams.date.formatted(date: .abbreviated, time: .omitted))
                            .foregroundColor(.gray)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showingDatePicker.toggle()
                    }
                    
                    if showingDatePicker {
                        DatePicker("", selection: $brewParams.date, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .tint(customOrange)
                    }
                    
                    NavigationLink {
                        List {
                            ForEach(["Espresso", "Pour Over", "French Press", "Aeropress"], id: \.self) { style in
                                Button {
                                    brewParams.brewStyle = style
                                    dismiss()
                                } label: {
                                    HStack {
                                        Text(style)
                                        Spacer()
                                        if brewParams.brewStyle == style {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(customOrange)
                                        }
                                    }
                                }
                            }
                        }
                        .navigationTitle("Brew Style")
                    } label: {
                        HStack {
                            Text("Brew Style")
                            Spacer()
                            Text(brewParams.brewStyle)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    NavigationLink {
                        List {
                            ForEach(["Lelit Anna PL41TEM", "V60", "Chemex"], id: \.self) { brewer in
                                Button {
                                    brewParams.brewer = brewer
                                    dismiss()
                                } label: {
                                    HStack {
                                        Text(brewer)
                                        Spacer()
                                        if brewParams.brewer == brewer {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(customOrange)
                                        }
                                    }
                                }
                            }
                        }
                        .navigationTitle("Brewer")
                    } label: {
                        HStack {
                            Text("Brewer")
                            Spacer()
                            Text(brewParams.brewer)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    NavigationLink {
                        List {
                            ForEach(["Kirinyaga - KB", "Ethiopia Yirgacheffe", "Colombia Huila"], id: \.self) { coffee in
                                Button {
                                    brewParams.coffee = coffee
                                    dismiss()
                                } label: {
                                    HStack {
                                        Text(coffee)
                                        Spacer()
                                        if brewParams.coffee == coffee {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(customOrange)
                                        }
                                    }
                                }
                            }
                        }
                        .navigationTitle("Coffee")
                    } label: {
                        HStack {
                            Text("Coffee")
                            Spacer()
                            Text(brewParams.coffee)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                // Dose and Drink Section
                Section {
                    HStack {
                        Text("Dose (g)")
                        Spacer()
                        TextField("Dose", text: $brewParams.dose)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($focusedField, equals: .dose)
                    }
                    
                    NavigationLink {
                        List {
                            ForEach(["Espresso", "Cortado", "Cappuccino", "Latte"], id: \.self) { drink in
                                Button {
                                    brewParams.drinkType = drink
                                    dismiss()
                                } label: {
                                    HStack {
                                        Text(drink)
                                        Spacer()
                                        if brewParams.drinkType == drink {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(customOrange)
                                        }
                                    }
                                }
                            }
                        }
                        .navigationTitle("Drink Type")
                    } label: {
                        HStack {
                            Text("Drink Type")
                            Spacer()
                            Text(brewParams.drinkType)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    HStack {
                        Text("Grind Setting")
                        Spacer()
                        TextField("Grind", text: $brewParams.grindSetting)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($focusedField, equals: .grindSetting)
                    }
                }
                
                // Equipment Section
                Section {
                    HStack {
                        Text("Grinder")
                        Spacer()
                        Button {
                            showingGrinderPopover = true
                        } label: {
                            HStack {
                                Text(brewParams.grinder)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.gray)
                                    .imageScale(.small)
                            }
                        }
                        .popover(isPresented: $showingGrinderPopover) {
                            List {
                                ForEach(["Lelit Anna PL41TEM", "Niche Zero", "DF64"], id: \.self) { grinder in
                                    Button {
                                        brewParams.grinder = grinder
                                        showingGrinderPopover = false
                                    } label: {
                                        HStack {
                                            Text(grinder)
                                                .foregroundColor(.primary)
                                            Spacer()
                                            if brewParams.grinder == grinder {
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(customOrange)
                                            }
                                        }
                                    }
                                }
                            }
                            .presentationCompactAdaptation(.popover)
                            .frame(minWidth: 300, minHeight: 200)
                        }
                    }
                    
                    HStack {
                        Text("Milk")
                        Spacer()
                        Button {
                            showingMilkPopover = true
                        } label: {
                            HStack {
                                Text(brewParams.milk)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.gray)
                                    .imageScale(.small)
                            }
                        }
                        .popover(isPresented: $showingMilkPopover) {
                            List {
                                ForEach(["None", "Whole", "Oat", "Almond"], id: \.self) { milk in
                                    Button {
                                        brewParams.milk = milk
                                        showingMilkPopover = false
                                    } label: {
                                        HStack {
                                            Text(milk)
                                                .foregroundColor(.primary)
                                            Spacer()
                                            if brewParams.milk == milk {
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(customOrange)
                                            }
                                        }
                                    }
                                }
                            }
                            .presentationCompactAdaptation(.popover)
                            .frame(minWidth: 300, minHeight: 200)
                        }
                    }
                    
                    HStack {
                        Text("Prep")
                        Spacer()
                        Button {
                            showingPrepPopover = true
                        } label: {
                            HStack {
                                Text(brewParams.prep)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.gray)
                                    .imageScale(.small)
                            }
                        }
                        .popover(isPresented: $showingPrepPopover) {
                            List {
                                ForEach(["WDT, RDT", "WDT", "RDT", "None"], id: \.self) { prep in
                                    Button {
                                        brewParams.prep = prep
                                        showingPrepPopover = false
                                    } label: {
                                        HStack {
                                            Text(prep)
                                                .foregroundColor(.primary)
                                            Spacer()
                                            if brewParams.prep == prep {
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(customOrange)
                                            }
                                        }
                                    }
                                }
                            }
                            .presentationCompactAdaptation(.popover)
                            .frame(minWidth: 300, minHeight: 200)
                        }
                    }
                }
                
                // Measurements Section
                Section {
                    HStack {
                        Text("Temp (F)")
                        Spacer()
                        TextField("Temperature", text: $brewParams.temperature)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($focusedField, equals: .temperature)
                    }
                    
                    HStack {
                        Text("Time")
                        Spacer()
                        TextField("Time", text: $brewParams.time)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .focused($focusedField, equals: .time)
                    }
                    
                    HStack {
                        Text("Yield (g)")
                        Spacer()
                        TextField("Yield", text: $brewParams.yield)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($focusedField, equals: .yield)
                    }
                }
                
                // Notes Section
                Section {
                    TextEditor(text: $brewParams.notes)
                        .frame(height: 100)
                        .focused($focusedField, equals: .notes)
                }
            }
            .navigationTitle("New Brew")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(customOrange)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Set") {
                        dismiss()
                    }
                    .foregroundColor(customOrange)
                }
                
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                        }
                        .foregroundColor(customOrange)
                    }
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { _ in
                        focusedField = nil
                    }
            )
        }
        .accentColor(customOrange)
        .onAppear {
            UIDatePicker.appearance().tintColor = UIColor(customOrange)
        }
        .interactiveDismissDisabled()
    }
}
