//
//  ViewController.swift
//  FrontloopsElement03
//
//  Created by Jinwook Kim on 2021/04/29.
//

import UIKit

class ViewController: UIViewController, StageManagerDelegate {
    var stageManager: StageManager = StageManager()
    @IBOutlet weak var submitStackView: UIStackView!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var chooseTitleButton: UIButton!
    @IBOutlet weak var chooseDescriptionButton: UIButton!
    @IBOutlet weak var confirmDataButton: UIButton!
    @IBOutlet weak var chooseTitleNumber: UILabel!
    @IBOutlet weak var chooseDescriptionNumber: UILabel!
    @IBOutlet weak var confirmDataNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateSubmitButton()
        self.updateContainer()
        self.stageManager.delegate = self
        self.stageManager.setStage(for: 0)
    }
    func updateSubmitButton() {
        self.submitButton.layer.cornerRadius = 10.0
    }
    func updateContainer() {
        self.container.layer.cornerRadius = 10.0
        self.container.layer.shadowColor = UIColor.darkGray.cgColor
        self.container.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.container.layer.shadowRadius = 10.0
        self.container.layer.shadowOpacity = 0.7
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            self.landscapeStackView()
        }
        else {
            self.portraitStackView()
        }
    }
    func portraitStackView() {
        self.mainStackView.axis = .vertical
        self.mainStackView.spacing = 30.0
    }
    func landscapeStackView() {
        self.mainStackView.axis = .horizontal
        self.mainStackView.spacing = 50.0
    }
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "Choose title":
            self.stageManager.setStage(for: 0)
        case "Choose description":
            self.stageManager.setStage(for: 1)
        case "Confirm data":
            self.stageManager.setStage(for: 2)
        default:
            print("Index out of range")
        }
    }
    @IBAction func submitButtonPressed(_ sender: UIButton) {
    }
    func updateUI(_ stageManager: StageManager, for stageNumber: Int) {
        self.deactivateLabels(for: 3)
        switch stageNumber {
        case 0:
            self.activateLabels(for: 0)
            self.showLabel.text = "Choose title content"
            self.submitButton.setTitle("Submit title", for: .normal)
        case 1:
            self.activateLabels(for: 0)
            self.activateLabels(for: 1)
            self.showLabel.text = "Choose description content"
            self.submitButton.setTitle("Submit description", for: .normal)
        case 2:
            self.activateLabels(for: 0)
            self.activateLabels(for: 1)
            self.activateLabels(for: 2)
            self.showLabel.text = "Are you happy now?"
            self.submitButton.setTitle("Yes, go ahead", for: .normal)
        default:
            print("Stage number out of range")
        }
    }
    func activateNumberLabel(for numberLabel: UILabel) {
        numberLabel.textColor = UIColor.white
        numberLabel.backgroundColor = UIColor.systemIndigo
        numberLabel.layer.cornerRadius = 25
        numberLabel.layer.masksToBounds = true
    }
    func deactivateNumberLabel(for numberLabel: UILabel) {
        numberLabel.textColor = UIColor.systemGray2
        numberLabel.backgroundColor = UIColor.clear
    }
    func activateButtonLabel(for buttonLabel: UIButton) {
        buttonLabel.setTitleColor(UIColor.darkGray, for: .normal)
    }
    func deactivateButtonLabel(for buttonLabel: UIButton) {
        buttonLabel.setTitleColor(UIColor.systemGray4, for: .normal)
    }
    func activateLabels(for index: Int) {
        switch index {
        case 0:
            self.activateButtonLabel(for: self.chooseTitleButton)
            self.activateNumberLabel(for: self.chooseTitleNumber)
        case 1:
            self.activateButtonLabel(for: self.chooseDescriptionButton)
            self.activateNumberLabel(for: self.chooseDescriptionNumber)
        case 2:
            self.activateButtonLabel(for: self.confirmDataButton)
            self.activateNumberLabel(for: self.confirmDataNumber)
        default:
            print("Index out of range")
        }
    }
    func deactivateLabels(for index: Int) {
        switch index {
        case 0:
            self.deactivateButtonLabel(for: self.chooseTitleButton)
            self.deactivateNumberLabel(for: self.chooseTitleNumber)
        case 1:
            self.deactivateButtonLabel(for: self.chooseDescriptionButton)
            self.deactivateNumberLabel(for: self.chooseDescriptionNumber)
        case 2:
            self.deactivateButtonLabel(for: self.confirmDataButton)
            self.deactivateNumberLabel(for: self.confirmDataNumber)
        case 3:
            self.deactivateButtonLabel(for: self.chooseTitleButton)
            self.deactivateNumberLabel(for: self.chooseTitleNumber)
            self.deactivateButtonLabel(for: self.chooseDescriptionButton)
            self.deactivateNumberLabel(for: self.chooseDescriptionNumber)
            self.deactivateButtonLabel(for: self.confirmDataButton)
            self.deactivateNumberLabel(for: self.confirmDataNumber)
        default:
            print("Index out of range")
        }
    }
}

