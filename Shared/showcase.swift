//
//  showcase.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-13.
//

import SwiftUI

struct showcase: View {
    @State var showMenu = false
        
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                            if $0.translation.width < -100 {
                                withAnimation {
                                    self.showMenu = false
                                }
                            }
                        }
        
        return NavigationView {
        GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
                    Home(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/1.60 : 0)
                            .disabled(self.showMenu ? true : false)
                if self.showMenu {
                                   Menu()
                                    .frame(width: geometry.size.width/1.60)
                                    .transition(.move(edge: .leading))
                               }
                }.gesture(drag)
        }
        .navigationBarItems(leading: (
                            Button(action: {
                                withAnimation {
                                    self.showMenu.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .imageScale(.large)
                            }
                        ))
                        .navigationBarTitle(Text("DASHBOARD")
                                             )
        }
        }
}

struct showcase_Previews: PreviewProvider {
    static var previews: some View {
        showcase()
    }
}
