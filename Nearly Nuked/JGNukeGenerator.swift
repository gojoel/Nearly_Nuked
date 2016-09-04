//
//  JGNukeGenerator.swift
//  Nearly Nuked
//
//  Created by Joel Goncalves on 7/13/15.
//  Copyright (c) 2015 EyeGame. All rights reserved.
//

import Foundation
import SpriteKit

class JGNukeGenerator: SKSpriteNode
{
    
    var generationTimer : NSTimer?
    var nukes = [JGNuke]()
    var nukeTracker = [JGNuke]()
    
    
    func startGeneratingNukeEvery(seconds: NSTimeInterval)
    {
        generationTimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generateNuke", userInfo: nil, repeats: true)
        
    }
    
    func stopGenerating(){
        generationTimer?.invalidate()
    }
    
    func generateNuke()
    {
        
        let width = UInt32(self.frame.size.width)
        var randSpawn = arc4random_uniform(UInt32(width+1))
        
        let nuke = JGNuke()
        nuke.name = "nuke"
        
        let nukeSize = UInt32(nuke.size.width/2)
        if (randSpawn < nukeSize) {
            randSpawn +=  (UInt32(nuke.size.width/2))
        }
        if (randSpawn > (width - nukeSize)){
            randSpawn -= (UInt32(nuke.size.width/2))
        }
        nuke.position.x = -CGFloat(randSpawn)
        nuke.position.y = size.height/2 + nuke.size.height/2
        nukes.append(nuke)
        nukeTracker.append(nuke)
        addChild(nuke)
    }
    
    func stopNukes() {
        stopGenerating()
        for nuke in nukes {
            nuke.stopMoving()
        }
    }
}
