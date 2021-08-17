//
//  reportview.swift
//  Scroll View
//
//  Created by Jaskirat Mangat on 2021-07-11.
//

import SwiftUI

struct reportview: View {
    
    
    @State private var inputText = ""
      @State private var wordCount: Int = 0
    @State private var name = ""
    @State private var type = "Personal"
    @State private var Currency = "CAD"
    @State private var amount = ""
    @State private var Date = ""
    @State private var Description = ""
    @Environment(\.presentationMode) var presentationMode
    static let types = ["Personal", "Business"]
    
    @ObservedObject var reports: Reports
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
                TextField("Report Name", text: $name)
                
                Image("pic")
                           .resizable()
                    .frame(width: 40, height: 49)
                    .scaledToFit()}
                HStack{
                
                Picker("Report Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                    
                    Text("    ")
               
                    
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
                VStack {
                    Text("Description")
                           TextEditor(text: $Description)
                               .font(.body)
                                                        .onChange(of: Description) { value in
                                   let words = Description.split { $0 == " " || $0.isNewline }
                                   self.wordCount = words.count
                               }
                }
               
            }
            .navigationBarTitle("Add new Report")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ReportItem(name: self.name, type: self.type, amount: actualAmount, description: Description)
                    self.reports.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }.foregroundColor(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0)))
        }
    }
}

struct reportview_Previews: PreviewProvider {
    static var previews: some View {
        reportview(reports: Reports())
    }
}
