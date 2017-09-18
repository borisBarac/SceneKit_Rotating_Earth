//: Playground - noun: a place where people can play

import UIKit
import SceneKit
import XCPlayground

let textures  = [UIImage(named: "Earth_Diffuse_HD.png"),
                 UIImage(named: "Earth_Specular_HD.png"),
                 UIImage(named: "Earth_Night_HD.png"),
                 UIImage(named: "Earth_Normal_HD.png")]

let scene = SCNScene()

let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
sceneView.scene = scene
sceneView.backgroundColor = .white
sceneView.autoenablesDefaultLighting = true

XCPlaygroundPage.currentPage.liveView = sceneView

let earthNode = SCNNode()
earthNode.geometry = SCNSphere(radius: 1)
earthNode.eulerAngles = SCNVector3(M_PI_4 / 2, 0, 0)

earthNode.geometry?.firstMaterial?.diffuse.contents = textures[0]
earthNode.geometry?.firstMaterial?.specular.contents = textures[1]
earthNode.geometry?.firstMaterial?.emission.contents = textures[2]
earthNode.geometry?.firstMaterial?.normal.contents = textures[3]

scene.rootNode.addChildNode(earthNode)

let rotationAction = SCNAction.rotate(by: CGFloat(2 * M_PI), around: SCNVector3(0, 1, 0), duration: 10)
let repeatRotation = SCNAction.repeatForever(rotationAction)
earthNode.runAction(repeatRotation)