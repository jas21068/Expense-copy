//
//  SwiftUIView.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-10.
//

import SwiftUI

struct AddView: View {
    
    @State private var inputText = ""
      @State private var wordCount: Int = 0
    @State private var name = ""
    @State private var type = "Card"
    @State private var Currency = "CAD"
    @State private var amount = ""
    @State private var Date = ""
    @State private var Description = ""
    @Environment(\.presentationMode) var presentationMode
    static let types = ["Card", "Cash"]
    static let CurrencyTypes = ["CAD", "USD"]
    @ObservedObject var expenses: Expenses
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    HStack{
                    
                    Image("person")
                               .resizable()
                        .frame(width: 50, height: 55)
                        .scaledToFit()
                        Text("           ")
                        VStack{
                        Text("Aditya jindal")
                        Text("Jindal639@gmail.com")
                        }
                    }
                }
                HStack{
                TextField("Merchant", text: $name)
                
                Image("pic")
                           .resizable()
                    .frame(width: 40, height: 49)
                    .scaledToFit()
                    
                }
                HStack{
                
                Picker("Payment Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                    
                    Text("    ")
                Picker("Currency", selection: $Currency) {
                    ForEach(Self.CurrencyTypes, id: \.self) {
                        Text($0)
                    }
                }
                    
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
                
                TextField("Date", text: $Date)
                
                VStack {
                    Text("Description")
                           TextEditor(text: $Description)
                               .font(.body)
                                                        .onChange(of: Description) { value in
                                   let words = Description.split { $0 == " " || $0.isNewline }
                                   self.wordCount = words.count
                               }
                }
                
//                TextField("Description", text: $Description)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount, description: Description)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }.foregroundColor(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0)))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
