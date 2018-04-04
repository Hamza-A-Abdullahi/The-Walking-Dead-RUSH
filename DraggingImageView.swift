//
//  DraggingImageView.swift
//  CarGame
//
//  Created by Hamza Abdullahi on 26/02/2018.
//  Copyright © 2018 Hamza Abdullahi. All rights reserved.
//

import UIKit

class DraggingImageView: UIImageView {
    
    var Delegate: subview?
    
    var startLocation: CGPoint? // define a golble variable
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        startLocation = touches.first?.location(in: self)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        
        self.Delegate?.changeSomething()
    }

    
}
