//
//  JGNuke.swift
//  Nearly Nuked
//
//  Created by Joel Goncalves on 6/21/15.
//  Copyright (c) 2015 EyeGame. All rights reserved.
//

import Foundation
import SpriteKit

class JGNuke : SKSpriteNode
{
    let NUKE_WIDTH : CGFloat = 30.0
    let NUKE_HEIGHT : CGFloat = 50.0
    let NUKE_COLOR = UIColor.orangeColor()
    let bomb = SKTexture(imageNamed: "bomb.png")
    
    init(){
        let bomb = SKTexture(imageNamed: "bomb.png")
        let size = CGSizeMake(NUKE_WIDTH, NUKE_HEIGHT)
        super.init(texture: bomb, color: nil, size: bomb.size())
        
        loadPhysicsBodyWithSize(bomb.size())
        startMoving()
    }
    
    func loadPhysicsBodyWithSize(size : CGSize)
    {
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.categoryBitMask = nukeCategory
        physicsBody?.collisionBitMask = groundCategory
        physicsBody?.dynamic = false
    }
    
    func startMoving() {
        let moveDown = SKAction.moveByX(0, y: -150 , duration: 1)
        runAction(SKAction.repeatActionForever(moveDown))
    }
    
    func stopMoving(){
        removeAllActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}