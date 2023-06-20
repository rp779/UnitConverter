//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ross Parsons on 6/19/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var inputDegree: Double = 0
    @State private var conversion: String = "Fahrenheit"
    @FocusState private var keyboardFocus: Bool
    
    let units: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Degrees", value: $inputDegree, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardFocus)
                } header: {
                    Text("Starting Degrees")
                }
                Section {
                    Picker("Units", selection: $conversion) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }.pickerStyle(.segmented)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    keyboardFocus = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
