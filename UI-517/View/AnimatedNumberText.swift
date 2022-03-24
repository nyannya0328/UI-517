//
//  AnimatedNumberText.swift
//  UI-517
//
//  Created by nyannyan0328 on 2022/03/24.
//

import SwiftUI

struct AnimatedNumberText: Animatable, View {
    var value : CGFloat
    var font : Font
    var floationgPoint : Int = 2
    var isCurrency : Bool = false
    var additionalString : String = ""
    
    var animatableData: CGFloat{
        
        get{value}
        set{value = newValue}
        
    }
    var body: some View {
        Text("\(isCurrency ? "$" : "")\(String(format: "%.\(floationgPoint)f", value))" + additionalString)
            .font(font)
    }
}

