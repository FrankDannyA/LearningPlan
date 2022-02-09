//
//  ViewController.swift
//  LearningPlan
//
//  Created by Даниил Франк on 08.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func lookAtPlan() {
        performSegue(withIdentifier: "goToPersonalLerningPlan", sender: nil)
    }
}

