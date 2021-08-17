//
//  CreateExpense.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-11.
//

import SwiftUI

struct CreateExpense: View {
    var body: some View {
        
        NavigationView{
            
            
            VStack(spacing: -150.0){
                Section{
                List {
                    Text("Expense")
                        .foregroundColor(Color.gray)
                    HStack{
                    Image("screen")
                               .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                    
                    Text("Manually Create")
                        .foregroundColor(Color.gray)
                    }
                    
                    HStack{
                    Image("camera")
                               .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                    
                    Text("Scan Reciept")
                        .foregroundColor(Color.gray)
                    }
                    
                    HStack{
                    Image("time")
                               .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                    
                    Text("Time")
                        .foregroundColor(Color.gray)
                    }
                    
                }
                    
                }
                List {
                    Text("Distance")
                        .foregroundColor(Color.gray)
                    HStack{
                    Image("car")
                               .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                    
                    Text("Manually Create")
                        .foregroundColor(Color.gray)
                    }
                    
                    HStack{
                    Image("globe")
                               .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                    
                    Text("Odometer")
                        .foregroundColor(Color.gray)
                    }
                    
                    HStack{
                    Image("location")
                               .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                    
                    Text("Start GPS")
                        .foregroundColor(Color.gray)
                    }
                }
                
                
            }
        
            .navigationBarTitle("Create Expenses")
        }
    }
}

struct CreateExpense_Previews: PreviewProvider {
    static var previews: some View {
        CreateExpense()
    }
}
