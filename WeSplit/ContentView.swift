//
//  ContentView.swift
//  WeSplit
//
//  Created by Rajesh Kumar Sahil on 25/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: String = ""
    @State private var numberOfPeople = 4
    @State private var tipPercentage: Int = 0
    
    
    var tipPercentages = [10,20,25,30,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2 ..< 100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you wat to leave?")){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
