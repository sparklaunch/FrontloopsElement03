//
//  StageManager.swift
//  FrontloopsElement03
//
//  Created by Jinwook Kim on 2021/04/29.
//

import Foundation

protocol StageManagerDelegate {
    func updateUI(_ stageManager: StageManager, for stageNumber: Int)
    func removeSecondSubmitButton(_ stageManager: StageManager)
    func updateSecondSubmitButton(_ stageManager: StageManager, with label: String)
}

struct StageManager {
    var currentStage: Int?
    var delegate: StageManagerDelegate?
    mutating func setStage(for stageNumber: Int) {
        if stageNumber > 2 {
            print("Stage number out of range")
            return
        }
        if abs((self.currentStage ?? 0) - stageNumber) <= 1 {
            switch stageNumber {
            case 0:
                delegate?.removeSecondSubmitButton(self)
            case 1:
                delegate?.removeSecondSubmitButton(self)
                delegate?.updateSecondSubmitButton(self, with: "Back")
            case 2:
                delegate?.removeSecondSubmitButton(self)
                delegate?.updateSecondSubmitButton(self, with: "No, go back")
            default:
                print("Stage number out of range")
            }
            self.currentStage = stageNumber
            self.delegate?.updateUI(self, for: self.currentStage!)
        }
        else {
            print("Stage difference greater than one")
        }
    }
}
