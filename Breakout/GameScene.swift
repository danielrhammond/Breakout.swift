//
//  GameScene.swift
//  Breakout
//
//  Created by Daniel Hammond on 7/14/14.
//  Copyright (c) 2014 Daniel Hammond. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let playerShip = SKSpriteNode(color: UIColor.blueColor(), size: CGSize(width: 200, height: 10)) // SKSpriteNode(imageNamed:"Spaceship")
    let ball = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 20, height: 20))
    
    override func didMoveToView(view: SKView) {
        self.addChild(self.playerShip)
        self.playerShip.position = CGPoint(x: self.size.width / 2.0, y: 10 )
        self.addChild(ball)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        ball.physicsBody.affectedByGravity = false
        ball.physicsBody.friction = 0
        ball.physicsBody.linearDamping = 0
        ball.physicsBody.restitution = 1
        ball.physicsBody.usesPreciseCollisionDetection = true
        playerShip.physicsBody = SKPhysicsBody(rectangleOfSize: playerShip.size)
        playerShip.physicsBody.dynamic = false
        playerShip.physicsBody.allowsRotation = false
        playerShip.physicsBody.restitution = 1
        ball.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        ball.physicsBody.applyImpulse(CGVectorMake(0, -10))
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let distanceX = sqrt(pow(location.x - playerShip.position.x, 2))
            let distanceRatio = distanceX / CGRectGetWidth(self.frame)
            let movementAction = SKAction.moveToX(location.x, duration: Double(distanceRatio * 2.0) )
            playerShip.runAction(movementAction)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
