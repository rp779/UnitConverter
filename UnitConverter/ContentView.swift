//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ross Parsons on 6/19/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var inputDegree: Double = 0
    @State private var inputUnit: String = "Fahrenheit"
    @State private var outputUnit: String = "Fahrenheit"
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
                    Picker("Units", selection: $inputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Input Unit")
                }
            
                Section {
                    Picker("Units", selection: $outputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
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
