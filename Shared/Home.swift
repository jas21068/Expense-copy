//
//  Home.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-11.
//

import SwiftUI

struct Home: View {
    
    @State private var showingReport = false
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
//        NavigationView{
            ScrollView(.vertical) {
                VStack(spacing: 10.0) {
                    Section {
                        ScrollView(.horizontal){
                            HStack(spacing: 42.0){
                            
                           
                            VStack{
                                
                                NavigationLink(destination: Invoices()) {
                            Image("invoice")
                                       .resizable()
                                .frame(width: 70, height: 70)
                                .scaledToFit()
                                }
                         Text("Invoice")
                            }
                                VStack{
                                Image("snapReciept")
                                           .resizable()
                                    .frame(width: 70, height: 70)
                                    .scaledToFit()
                                
                             Text("Snap Reciept")
                                }
                                
                                
                                VStack{
                                    NavigationLink(destination: ContentView()) {
                                    
                                    
                                Image("Expenses")
                                           .resizable()
                                    .frame(width: 70, height: 70)
                                    .scaledToFit()
                                    }
                             Text("Expenses")
                                }
                                
                                
                                
                                VStack{
                                Image("invoice")
                                           .resizable()
                                    .frame(width: 70, height: 70)
                                    .scaledToFit()
                                
                             Text("Invoice")
                                }
                                
                                
                                
                                
                                VStack{
                                Image("invoice")
                                           .resizable()
                                    .frame(width: 70, height: 70)
                                    .scaledToFit()
                                
                             Text("Invoice")
                                }
                            
                            }
                        }
                        .background(Color(red: 0.971, green: 0.967, blue: 0.967))
                    }
                    
                    
                //section2
                    
                    Section {
                        VStack(spacing: 14.0){
                            
                            HStack(spacing: 5.0){
                                Section{
                                    
                                    VStack{
                                        Text("1")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading, -68.0)
                                            .foregroundColor(.white)
                                        Text("Unreported Expenses")
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            
                                    }       .frame(width: 167.0, height: 71.0)
                                    
                                }
                                .background(Color(red: 0.496, green: 0.817, blue: 0.082))
                                .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                                
                                Section{
                                    
                                    VStack{
                                        Text("5")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading, -68.0)
                                            .foregroundColor(.white)
                                        Text("Unreported Reports")
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            
                                    }
                                }
                                .frame(width: 166.0, height: 71.0)
                                
                                .background(Color(red: 0.243, green: 0.165, blue: 0.82))
                                .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            }
                            
                            
                            //section3
                            
                            Section{
                                
                                VStack{
                                    Text("3")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading, -160.0)
                                        .foregroundColor(.white)
                                    Text("Submitted reports")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.leading, -160.0)
                                        
                                }
                            }
                            .frame(width: 343.0, height: 71.0)
                            .background(Color(red: 0.961, green: 0.118, blue: 0.22))
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            
                            
                            
                        }
                        
                    }
                   //tax section
                    Section{
                        VStack{
                            
                            HStack{
                                Text("Total tax amount")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                 Text("                 ")
                               
                                Text("Year 2021")
                                    .foregroundColor(.white)
                                
                            }
                            Text("$2200")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.leading, -160.0)
                        }
                    }
                    .frame(width: 343.0, height: 71.0)
                    .background(Color(red: 0.496, green: 0.817, blue: 0.082))
                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    //stats
                    Image("stats")
                               .resizable()
                        
                        .scaledToFit()
               
                    //driven
                    
                    Section{
                        
                        HStack{
                            
                            VStack{
                                Text("244")
                                    .font(.title)
                                    .foregroundColor(.white)
//                                foregroundColor(.white)
                                Text("Kms Driven")
                                    .foregroundColor(.white)
//
//                                    .foregroundColor(.white)
                            }
                            
                            Text("                                      ")
                            Image("car2")
                                       .resizable()
                                .frame(width: 70, height: 70)
                                .scaledToFit()
                            
                        }
                    }
                    .frame(width: 343.0, height: 71.0)
                    .background(Color(red: 0.961, green: 0.118, blue: 0.22))
                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                //text
                    Text("Most Recent Reports")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                   //last section'
                    
                    Section{
                        HStack{
                            Image("Report")
                                       .resizable()
                                .frame(width: 70, height: 70)
                                .scaledToFit()
                            VStack{
                                Text("There are no recent reports")
                                    .fontWeight(.bold)
                                
                                Button("+ New report") {
                                    
                                    self.showingReport = true
                                }
                                .frame(width: 146.0, height: 32.0)
                                .foregroundColor(.white)
                                .background(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0))
                                .cornerRadius(20)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    .frame(width: 359.0, height: 81.0)
                    
                }
                .sheet(isPresented: $showingReport) {
                    Report()
                }
                .frame(maxWidth: .infinity)
//            }
//            
//            .navigationBarTitle(Text("DASHBOARD")
//                                 )
//            .navigationBarItems(leading:           Button(action: {
//                withAnimation {
//                              self.showMenu = true
//                           }
//                                    }) {
//                                        Image(systemName: "menubar.rectangle")
//                                            .foregroundColor(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0))
//                                    })
            
        }
        
    }
}



struct CustomText: View {
    var text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home(showMenu: self.$showMenu)
//    }
//}
