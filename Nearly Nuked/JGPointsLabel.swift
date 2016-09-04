//
//  JGPointsLabel.swift
//  Nearly Nuked
//
//  Created by Joel Goncalves on 9/4/16.
//  Copyright (c) 2016 EyeGame. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class JGPointsLabel : SKLabelNode
{
    var number = 0;
    
    init (num: Int)
    {
        super.init()
        
        fontColor = UIColor.blackColor();
        fontName = "Helvetica"
        fontSize = 27.0;
        
        number = num;
        text = "\(num)";
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func increment ()
    {
        number++;
        text = "\(number)";
    }
    
    func setScore(num: Int)
    {
        self.number = num
        text = "\(self.number)"
    }
    
}
