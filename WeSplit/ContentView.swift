//
//  ContentView.swift
//  WeSplit
//
//  Created by Swapanjeet Singh on 02/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var totalCheckAmount = ""
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        //  let totalAmount = Double(totalCheckAmount)
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Check Amount")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Total Amount for check")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                
                Picker("Number of People", selection: $numberOfPeople) {
                            ForEach(2 ..< 100) {
                                    Text("\($0) people")
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("We Split")
        }
        
    }
}

// To show a preview of your UI design alongside
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


