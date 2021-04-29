//
//  StageManager.swift
//  FrontloopsElement03
//
//  Created by Jinwook Kim on 2021/04/29.
//

import Foundation

protocol StageManagerDelegate {
    func updateUI(_ stageManager: StageManager, for stageNumber: Int)
}

struct StageManager {
    var currentStage: Int?
    var delegate: StageManagerDelegate?
    mutating func setStage(for stageNumber: Int) {
        self.currentStage = stageNumber
        self.delegate?.updateUI(self, for: self.currentStage!)
    }
}
