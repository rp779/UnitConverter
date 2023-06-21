//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ross Parsons on 6/19/23.
//

import SwiftUI



struct ContentView: View {
    
    enum DegreeUnit: String, CaseIterable {
        case fahrenheit = "Fahrenheit"
        case celsius = "Celsius"
        case kelvin = "Kelvin"
    }
    
    @State private var inputDegree: Double = 0
    @State private var inputUnit: DegreeUnit = .fahrenheit
    @State private var outputUnit: DegreeUnit = .fahrenheit
    @FocusState private var keyboardFocus: Bool
    
    func baseDegreeCelsius(value: Double, inputUnit: DegreeUnit) -> Double {
        if inputUnit == .fahrenheit {
            return (inputDegree - 32) * (5/9)
        }
        
        if inputUnit == .kelvin {
            return inputDegree - 273.15
        }
        return inputDegree
    }
    
    var output: Double {
        
        
        
        return 0
    }
    
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
                        ForEach(DegreeUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Input Unit")
                }
            
                Section {
                    Picker("Units", selection: $outputUnit) {
                        ForEach(DegreeUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
                Section {
                    Text(output
                        .formatted(.number.precision(.fractionLength(2))))
                } header: {
                    Text("Conversion")
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
