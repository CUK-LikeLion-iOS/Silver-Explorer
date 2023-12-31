//
//  ARCharacterSelectViewController.swift
//  Silver Explorer
//
//  Created by Jinyoung Yoo on 2023/07/27.
//

import UIKit
import SceneKit

class ARCharacterSelectViewController: UIViewController, ARCharacterDelegate {

    private var selectedCharacter: Character = .none

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func moveBackBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func pushedArrButton(_ sender: UIButton) {
        selectedCharacter = .Arr
        Navigator.moveToTouchGestureExploreVC(vc: self)
    }
    @IBAction private func pushedFinnButton(_ sender: UIButton) {
        selectedCharacter = .Finn
        Navigator.moveToTouchGestureExploreVC(vc: self)
    }

    func selectedARCharacter() -> ARCharacter? {
        switch selectedCharacter {
        case .Arr:
            guard let containerNode: SCNNode = Arr.makeArrContainerNode() else {
                return nil
            }
            return Arr(arrContainerNode: containerNode)
        case .Finn:
            guard let containerNode: SCNNode = Finn.makeFinnContainerNode() else {
                return nil
            }
            return Finn(finnContainerNode: containerNode)
        default:
            return nil
        }
    }
}
