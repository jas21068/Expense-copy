//
//  landing.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-11.
//

import SwiftUI

struct landing: View {
    var body: some View {
       CustomController()
    }
}

struct landing_Previews: PreviewProvider {
    static var previews: some View {
        landing()
    }
}

struct CustomController: UIViewControllerRepresentable{
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomController>) ->  UIViewController {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "landing")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CustomController>) {
        
    }
    
    
}
//struct customController : UIViewControllerRepresentable{
//    
//    
//    
//    func mak
//    
//    
//}
