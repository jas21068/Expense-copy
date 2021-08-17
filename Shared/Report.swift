//
//  Report.swift
//  Scroll View
//
//  Created by Jaskirat Mangat on 2021-07-11.
//

import SwiftUI

struct Report: View {
    @ObservedObject var reports = Reports()

    @State private var showingAddExpense = false
    @State private var showingCreateExpense = false
    @State private var type = "Card"
    @State private var Currency = "CAD"
    
    @State private var Date = ""
    @State private var Description = ""
    @Environment(\.presentationMode) var presentationMode
    static let types = ["Card", "Cash"]
    static let CurrencyTypes = ["CAD", "USD"]
    var body: some View {
        NavigationView {
            
            List {Section {
                VStack(spacing: 15.0) {
                    Image("expense")
                               .resizable()
                        .frame(width: 37.25, height: 42.17)
                        .scaledToFit()
                    
                    
                    Text("Create your first Report")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Text("Tap the button below and we’ll take care of everything else.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    Button("Create Reports") {
                        
                        self.showingCreateExpense = true
                    }
                    .frame(width: 146.0, height: 32.0)
                    .foregroundColor(.white)
                    .background(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0))
                    .cornerRadius(20)
                }
            }
                ForEach(reports.items) { item in
                    NavigationLink(destination:
                    
                                    Form{
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
                                        HStack{
                                        Text("EXPENSE")
                                        Text("                                       ")
                                        Image("pic")
                                                   .resizable()
                                            .frame(width: 40, height: 49)
                                            .scaledToFit()
                                            
                                        }
                                        
                                        HStack{
                                        Text("Amount")
                                        Text("                                       ")
                                            Text("$AMOUNT")
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
                                        VStack{
                                            Text("Description")
                                                .font(.title)
                                            
                                        Text(item.description)
                                        }
                                }
                    
                    
                    
                    )
                    {
                    if item.amount < 100 && item.amount > 10{
                        HStack(spacing: 0.0){
                            
                            
                            
                            
                            
                            
                            VStack(alignment: .leading, spacing: 0.0) {
                                Text("Aditya's Expenses")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                Text("Invoice #764756789")
                                    .font(.body)
                                
                              
                             
                                
                                Text("$\(item.amount)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.trailing)
                           }

                           Spacer()
                            Button("OPEN") {
                        
                            }
                            .frame(width: 73.0, height: 19.0)
                            .foregroundColor(.white)
                            .background(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0))
                            .cornerRadius(20)
                            
                       }
                    }
                    else if item.amount < 10 {
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                   Text(item.name)
                                       .font(.headline)
                                   Text(item.type)
                               }

                               Spacer()
                               Text("$\(item.amount)")
                           }
                        
                    }
                    }
                }.onDelete(perform: removeItems)
                
            }
            .sheet(isPresented: $showingAddExpense) {
                reportview(reports: self.reports)
            }
            
           
            .navigationBarTitle("My Reports")
            
            .navigationBarItems(leading: EditButton().foregroundColor(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0)), trailing:
                                    Button(action: {
                                        self.showingAddExpense = true
                                    }) {
                                        Image(systemName: "plus")
                                            .foregroundColor(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0))
                                    })
                                
            
            

        }
    }
    
    func removeItems(at offsets: IndexSet) {
        reports.items.remove(atOffsets: offsets)
    }
}


struct ReportItem: Identifiable , Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
    let description:String
}
class Reports: ObservableObject {
    @Published var items = [ReportItem](){
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ReportItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}





struct Report_Previews: PreviewProvider {
    static var previews: some View {
        Report()
    }
}

