//
//  GestureHandlerModel.swift
//  Silver Explorer
//
//  Created by Jinyoung Yoo on 10/28/23.
//

import UIKit

struct GestureRecongizerCreator {
    
    static func applyToARCharacter(target arCharacter: ARCharacter, _ stage: Stage.StageType) -> [UIGestureRecognizer] {
        switch stage {
        case .shortTap:
            let tapGesture = UITapGestureRecognizer(target: arCharacter, action: #selector(arCharacter.jump))
            return [tapGesture]

        case .longTap:
            let longPressGesture = UILongPressGestureRecognizer(target: arCharacter, action: #selector(arCharacter.highJump))
            longPressGesture.minimumPressDuration = 0.1
            return [longPressGesture]

        case .swipe:
            let leftSwipeGesture = UISwipeGestureRecognizer(target: arCharacter, action: #selector(arCharacter.rightAngleRotate))
            let rightSwipeGesture = UISwipeGestureRecognizer(target: arCharacter, action: #selector(arCharacter.rightAngleRotate))
            let upSwipeGesture = UISwipeGestureRecognizer(target: arCharacter, action: #selector(arCharacter.rightAngleRotate))
            let downSwipeGesture = UISwipeGestureRecognizer(target: arCharacter, action: #selector(arCharacter.rightAngleRotate))
            
            leftSwipeGesture.direction = .left
            rightSwipeGesture.direction = .right
            upSwipeGesture.direction = .up
            downSwipeGesture.direction = .down
            
            return [leftSwipeGesture, rightSwipeGesture, upSwipeGesture, downSwipeGesture]

        case .drag:
            let panGesture = UIPanGestureRecognizer(target: arCharacter, action: #selector(arCharacter.eulerAngleRotate))
            return [panGesture]

        case .pinch:
            let pinchGesture = UIPinchGestureRecognizer(target: arCharacter, action: #selector(arCharacter.scaleUpAndDown))
            return [pinchGesture]

        case .rotate:
            let rotationGesture = UIRotationGestureRecognizer(target: arCharacter, action: #selector(arCharacter.zAxisRotate))
            return [rotationGesture]
        }
    }
    
    static func applyToARKiosk(target arKiosk: ARKioskModel) -> [UIGestureRecognizer] {
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: arKiosk, action: #selector(arKiosk.rightAngleRotate))
        let rightSwipeGesture = UISwipeGestureRecognizer(target: arKiosk, action: #selector(arKiosk.rightAngleRotate))
        let pinchGesture = UIPinchGestureRecognizer(target: arKiosk, action: #selector(arKiosk.scaleUpAndDown))
        
        leftSwipeGesture.direction = .left
        rightSwipeGesture.direction = .right
        
        return [pinchGesture, leftSwipeGesture, rightSwipeGesture]
    }
}

