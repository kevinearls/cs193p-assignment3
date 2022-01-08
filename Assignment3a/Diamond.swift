//
//  Diamond.swift
//  Assignment3a
//
//  Created by Kevin Earls on 06/01/2022.
//

import Foundation
import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var p=Path()
        //print("minX \(rect.minX) maxX \(rect.maxX) minY \(rect.minY) maxY \(rect.maxY)" )
        
        let topCenter = CGPoint(x:rect.maxX / 2, y: 0)
        let bottomCenter = CGPoint(x:rect.maxX / 2, y: rect.maxY)
        let left = CGPoint(x:0, y:rect.maxY / 2)
        let right = CGPoint(x:rect.maxX, y:rect.maxY / 2)
        
        p.move(to: topCenter)
        p.addLine(to: right)
        p.addLine(to: bottomCenter)
        p.addLine(to: left)
        p.addLine(to: topCenter)
        
        return p
    }
}


struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond().foregroundColor(Color.indigo)
    }
}
