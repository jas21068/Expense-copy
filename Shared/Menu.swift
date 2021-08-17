//
//  Menu.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-11.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Section{
                
                HStack{
                   
                
                    Image(systemName: "person.circle")
                               .resizable()
                        .frame(width: 45, height: 45)
                        .scaledToFit()
                    VStack{
                     Text("Aditya Jindal")
                        Text("Premium").foregroundColor(.purple)
                    }
                    
                }
                
            }
            .frame(width: 182.0, height: 63.0)
            .background(Color(.white))
            .padding(.top, 160)
            .padding(.leading, -30)
            
                    HStack {
                        Image(systemName: "homekit")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Home")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                        .padding(.top, 30)
                    

            HStack {NavigationLink(destination: Report()) {
                        Image(systemName: "newspaper")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("report")
                            .foregroundColor(.white)
                            .font(.headline)
            }
                    }
                        .padding(.top, 30)
                    HStack {
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("camera")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                        .padding(.top, 30)
            
            HStack {
                NavigationLink(destination: ContentView ()) {
                Image(systemName: "newspaper")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("expenses")
                    .foregroundColor(.white)
                    .font(.headline)
                    
                }
            }
                .padding(.top, 30)
            
            
            HStack {
                NavigationLink(destination: CardView ()) {
                Image(systemName: "creditcard")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Cards")
                    .foregroundColor(.white)
                    .font(.headline)
                    
                }
            }
                .padding(.top, 30)
            
            
            HStack {
                NavigationLink(destination: Invoices()) {
                Image(systemName: "note.text")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Approved invoice")
                    .foregroundColor(.white)
                    .font(.headline)
                    
                }
            }
                .padding(.top, 30)
            Spacer()
                }
        .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0))                    .edgesIgnoringSafeArea(.all)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
