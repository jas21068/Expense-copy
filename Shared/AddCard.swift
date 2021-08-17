//
//  AddCard.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-14.
//

//
//  AddCard.swift
//  Cards
//
//  Created by Jaskirat Mangat on 2021-07-14.
//

import SwiftUI

struct AddCard: View {
    @State private var name = ""
    @State private var type = "Visa"
    @State private var Currency = "CAD"
    @State private var amount = ""
    @State private var Date = ""
    @State private var Description = ""
    @Environment(\.presentationMode) var presentationMode
    static let types = ["Visa", "Mastercard", "Amex"]
    static let CurrencyTypes = ["CAD", "USD"]
    @ObservedObject var expenses: Cards
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
                TextField("payment description", text: $name)
                
                Image("pic")
                           .resizable()
                    .frame(width: 40, height: 49)
                    .scaledToFit()}
                HStack{
                
                Picker("Card Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                    
              
                    
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
                
                TextField("Expiry Date", text: $Date)
                
                TextField("CVV", text: $Description)
            }
            .navigationBarTitle("Add new card payment")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = CardItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }.foregroundColor(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0)))
        }
    }
}

struct AddCard_Previews: PreviewProvider {
    static var previews: some View {
        AddCard(expenses: Cards())
    }
}

