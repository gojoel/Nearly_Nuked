//
//  JGHero.swift
//  Nearly Nuked
//
//  Created by Joel Goncalves on 6/14/15.
//  Copyright (c) 2015 EyeGame. All rights reserved.
//

import Foundation
import SpriteKit

var ninja : SKSpriteNode!
var ninjaWalkingFrames : [SKTexture]!

class JGHero: SKSpriteNode
{
    let tex = SKTexture(imageNamed: "ninja1.png")

    init() {
        
        super.init(texture: tex, color: UIColor.orangeColor(), size: CGSizeMake(0,0)) // empty initializer
        

        setupNinja()
        
        let firstFrame = ninjaWalkingFrames[0]
        ninja = SKSpriteNode(texture: firstFrame)
        addChild(ninja)
        
        loadPhysicsBodyWithSize(ninja.size)
  
    }
    
    // set-up texture atlas & get image names
    func setupNinja()
    {
        let ninjaAnimatedAtlas = SKTextureAtlas(named: "NinjaImages")
        var walkFrames = [SKTexture]()
        
        let numImages = ninjaAnimatedAtlas.textureNames.count
        for var i=1; i < numImages; i++ {
            let ninjaTextureName = "ninja\(i)"
            walkFrames.append(ninjaAnimatedAtlas.textureNamed(ninjaTextureName))
        }
        ninjaWalkingFrames = walkFrames
    }
    
    // walking infinitely in place
    func walkingNinja()
    {
        //This is our general runAction method to make our ninja walk.
        ninja.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(ninjaWalkingFrames,
                timePerFrame: 0.1,
                resize: false,
                restore: true)),
            withKey:"walkingInPlaceNinja")
    }
    
    func loadPhysicsBodyWithSize(size : CGSize){
        ninja.physicsBody = SKPhysicsBody(rectangleOfSize: ninja.size)
        ninja.physicsBody?.categoryBitMask = heroCategory
        ninja.physicsBody?.collisionBitMask = nukeCategory | groundCategory | sceneCategory
        ninja.physicsBody?.contactTestBitMask = nukeCategory
        //ninja.physicsBody?.dynamic = true;
        ninja.physicsBody?.affectedByGravity = false
    }
    
    func start()
    {
        if (ninja.actionForKey("ninjaMoving") != nil) {
            //stop just the moving to a new location, but leave walking legs movement running
            ninja.removeActionForKey("ninjaMoving")
        }
        //2
        if (ninja.actionForKey("walkingInPlaceNinja") == nil){
            // if legs are not moving go ahead and start
            walkingNinja()
        }
        //3
        var incrementRight = SKAction.moveByX(1.0, y: 0, duration: 0.01)
        
        var multiplierForDirection : CGFloat
        
        if (ninja.xScale > 0) {
            // walk left
            multiplierForDirection = -1.0
            incrementRight = SKAction.moveByX(-1.0, y: 0, duration: 0.01)
        } else {
            // walk right
            multiplierForDirection = 1.0
        }
        ninja.xScale = fabs(ninja.xScale) * multiplierForDirection
        
        //4
        let doneAction = (SKAction.runBlock({
            println("Animation Complete")
            self.ninjaMoveEnded()
        }))
        //5
        let moveActionWithDone = (SKAction.repeatActionForever(incrementRight))
        ninja.runAction(moveActionWithDone, withKey: "ninjaMoving")

    }
    
    func fall()
    {
        ninja.texture = deadNinja
        //physicsBody?.affectedByGravity = true
        //physicsBody?.applyImpulse(CGVectorMake(-8, 30))
        //let rotateBack = SKAction.rotateByAngle(CGFloat(M_PI) / 2, duration: 0.4)
        //runAction(rotateBack)
    }
    
    func ninjaMoveEnded()
    {
        ninja.removeAllActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}