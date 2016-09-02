//
//  Constants.swift
//  Nearly Nuked
//
//  Created by Joel Goncalves on 7/23/15.
//  Copyright (c) 2015 EyeGame. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

var deadNinja = SKTexture(imageNamed: "dead.png")

//Collision Detection
let heroCategory   : UInt32 = 0x1 << 0 // 00000000000000000000000000000001
let nukeCategory : UInt32 = 0x1 << 1 // 00000000000000000000000000000010
let groundCategory: UInt32 = 0x1 << 2
let sceneCategory : UInt32 = 0x1 << 3
