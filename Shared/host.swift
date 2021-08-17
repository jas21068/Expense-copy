//
//  host.swift
//  Expense
//
//  Created by Jaskirat Mangat on 2021-07-11.
//

import UIKit
import SwiftUI


class SwiftUIViewHostingController: UIHostingController<showcase> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: showcase())
    }
}


class SwiftUIViewHostingController2: UIHostingController<Report> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: Report())
    }
}

class SwiftUIViewHostingController3: UIHostingController<CardView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: CardView())
    }
}
