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
        
        var topCenter = CGPoint(x:rect.maxX / 2, y: 0)
        var bottomCenter = CGPoint(x:rect.maxX / 2, y: rect.maxY)
        let left = CGPoint(x:0, y:rect.maxY / 2)
        let right = CGPoint(x:rect.maxX, y:rect.maxY / 2)
        
        // "Squish" diamond to fit aspect ratio
        let horizontalPixels = right.x - left.x
        let verticalPixels = bottomCenter.y - topCenter.y
        
        // vertical should only be aspectRatio * horizontal difference...need to adjust top/bottom center
        let adjustment = floor((verticalPixels - (horizontalPixels * 1/3)) / 2)
        print("Diamand horizontal \(horizontalPixels) vertical \(verticalPixels) Adjustment \(adjustment)")
        if adjustment > 0.0 {
            topCenter = CGPoint(x: topCenter.x, y:topCenter.y + adjustment)
            bottomCenter = CGPoint(x: bottomCenter.x, y: bottomCenter.y - adjustment)
        }

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
