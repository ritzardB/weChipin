//
//  ContentView.swift
//  WeSplit
//
//  Created by Richard Balabarcon on 11/24/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    @State private var taxPercentage = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let totalTaxes = orderAmount * 0.12
        let grandTotal = (orderAmount + tipValue) + totalTaxes
        
        
        return grandTotal
        }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
         
        let tipValue = orderAmount / 100 * tipSelection
        let totalTaxes = orderAmount * 0.12
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = (grandTotal + totalTaxes) / peopleCount
        
        return amountPerPerson
        
    }
    
    var totalTax: Double {
        let orderAmount = Double(checkAmount) ?? 0
        _ = Double(taxPercentage)
        
        let totalTaxes = orderAmount * 0.12
        
        return totalTaxes
    }
    
    
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
              
                TextField("Number of People", text: $numberOfPeople)
                    .keyboardType(.decimalPad)
      
            }
            
            Section (header: Text("How much tip do you want to leave?")){
                Picker("Tip percentage", selection: $tipPercentage){
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.blue)
            }
            
            Section (header: Text("Amount per person")){
                Text("$\(totalPerPerson, specifier: "%.2f")")
                
            }
            
            Section (header: Text("Total Taxes")){
                Text("$\(totalTax, specifier: "%.2f")")
            }
            
            Section (header: Text("Grand Total Amount")){
                Text("$\(grandTotal, specifier: "%.2f")")
            }
            
        } // form view
        .navigationTitle("WeChip'n")
        .background(Color.blue.edgesIgnoringSafeArea(.all))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

