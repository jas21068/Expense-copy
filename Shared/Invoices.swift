//
//  Invoices.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-11.
//

import SwiftUI

struct Invoices: View {
    
    @State private var type = "approved"

    static let types = ["approved", "rejected","overdue","pending"]
    var body: some View {
        
        
            VStack{
                
                
          
                
                List{
                    
                    Section{
                        
                        Text("Choose the filtering method")
                        Picker("Report Type", selection: $type) {
                            ForEach(Self.types, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    
                    HStack(spacing: 0.0){
                        
                        
                        Image("img")
                                   .resizable()
                            .frame(width: 37.25, height: 42.17)
                            .scaledToFit()
                        
                        Text("        ")
                        
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Invoice #764756789")
                                .font(.body)
                            
                           Text("Food")
                         
                            
                            Text("$25")
                                .font(.title)
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.trailing)
                       }

                       Spacer()
                        Button("approved") {
                    
                        }
                        .frame(width: 83.0, height: 19.0)
                        .foregroundColor(.white)
                        .background(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0))
                        .cornerRadius(20)
                        
                   }
                    
                    HStack(spacing: 0.0){
                        
                        
                        Image("img")
                                   .resizable()
                            .frame(width: 37.25, height: 42.17)
                            .scaledToFit()
                        
                        Text("        ")
                        
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Invoice #764756789")
                                .font(.body)
                            
                           Text("car")
                         
                            
                            Text("$55")
                                .font(.title)
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.trailing)
                       }

                       Spacer()
                        Button("rejected") {
                    
                        }
                        .frame(width: 73.0, height: 19.0)
                        .foregroundColor(.white)
                        .background(Color(.red))
                        .cornerRadius(20)
                        
                   }
                }
                
            }
        
    }
}

struct Invoices_Previews: PreviewProvider {
    static var previews: some View {
        Invoices()
    }
}
