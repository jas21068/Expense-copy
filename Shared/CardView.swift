//
//  CardView.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-14.
//

//
//  ContentView.swift
//  Shared
//
//  Created by Jaskirat Mangat on 2021-07-14.
//

//
//  ContentView.swift
//  Shared
//
//  Created by Jaskirat Mangat on 2021-07-10.
//
import SwiftUI
import Combine

struct CardView: View {
    @ObservedObject var expenses = Cards()

    @State private var showingAddExpense = false
    @State private var showingCreateExpense = false
    
    
    
    var body: some View {
        NavigationView {
            
            List {Section {
                VStack(spacing: 15.0) {
                    
                    GeometryReader { geometry in
                                    ImageCarouselView(numberOfImages: 3) {
                                        Image("card1")
                                            .resizable()
                                            .frame(width: 299.0, height: 170.0)
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                        Image("card2")
                                            .resizable()
                                            .frame(width: 299.0, height: 170.0)
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                        Image("card3")
                                            .resizable()
                                            .frame(width: 299.0, height: 170.0)
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                    }
                                }.frame(height: 300, alignment: .center)
                    
                }
            }
            
            ForEach(expenses.items) { item in
                    
                    if item.amount < 100 && item.amount > 10{
                        HStack(spacing: 0.0){
                            
                            
                            Image(systemName: "creditcard.circle.fill")
                                       .resizable()
                                .frame(width: 37.25, height: 42.17)
                                .scaledToFit()
                            
                            Text("         ")
                            
                            VStack(alignment: .leading, spacing: 0.0) {
                             
                                
                               Text(item.name)
                             
                                
                                Text("$\(item.amount)")
                                    .font(.body)
                                    .foregroundColor(Color(red: 0.706, green: 0.867, blue: 0.498, opacity: 1.0))
                                    .multilineTextAlignment(.trailing)
                           }

                           Spacer()
                            Button("success") {
                        
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
                    
                }.onDelete(perform: removeItems)
                
            }
            .sheet(isPresented: $showingAddExpense) {
                AddCard(expenses: self.expenses)
            }
            
            .navigationBarTitle("Cards")
            
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
        expenses.items.remove(atOffsets: offsets)
    }
    
}
struct CardItem: Identifiable , Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}
class Cards: ObservableObject {
    @Published var items = [CardItem](){
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
            if let decoded = try? decoder.decode([CardItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}



struct ImageCarouselView<Content: View>: View {
    private var numberOfImages: Int
    private var content: Content

    @State private var currentIndex: Int = 0
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0)
            .animation(.spring())
            .onReceive(self.timer) { _ in
                
                self.currentIndex = (self.currentIndex + 1) % 3
            }
        }
    }
}

