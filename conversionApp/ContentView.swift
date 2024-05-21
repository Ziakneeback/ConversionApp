//
//  ContentView.swift
//  conversionApp
//
//  Created by Жанибек Асылбек on 12.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber: Double = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    
    let units = ["seconds", "minutes", "hours", "days"]
    var presult: Double {
        var presult: Double = 0.0
        switch inputUnit{
        case "seconds":
            presult = inputNumber
        case "minutes":
            presult = inputNumber * 60
        case "hours":
            presult = inputNumber * 3600
        case "days":
            presult = inputNumber * 86400
        default:
            return 0
        }
        return presult
    }
    
    var outputNumber: Double {
        var result: Double = 0.0
        switch outputUnit{
        case "seconds":
            result = presult
        case "minutes":
            result = presult / 60
        case "hours":
            result = presult / 3600
        case "days":
            result = presult / 86400
        default:
            return 0
        }
        return result
    }
    
    var body: some View {
        NavigationStack{
            Form{
                
                Section("Input"){
                    TextField("Enter your number", value: $inputNumber, format: .number)
                    
                    Picker("Unit", selection: $inputUnit){
                        ForEach(units, id:\.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output"){
                    Text(outputNumber, format: .number)

                    Picker("Unit", selection: $outputUnit){
                        ForEach(units, id:\.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
            }
            .navigationTitle("Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
