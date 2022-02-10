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
    
    func modelForDestination() -> ModelTearm {
        let destinationModel = ModelTearm(learningYear: "2022 - 2023 Уч год",
                                          nameOfDiscipline: [Classes.electrochemistry,
                                                             Classes.languageC1,
                                                             Classes.fundamentalsOfChemicalAnalysis],
                                          academycHoursLectio: [TimeForClasses.electrochemistry_F: 10,
                                                                TimeForClasses.electrochemistry_P: 30,
                                                                TimeForClasses.languageC1_F: 30,
                                                                TimeForClasses.languageC1_P: 30,
                                                                TimeForClasses.fundamentalsOfChemicalAnalysis_F : 10,
                                                                TimeForClasses.fundamentalsOfChemicalAnalysis_P : 30],
                                          academycHoursSeminar: [TimeForClasses.electrochemistry_F: 5,
                                                            TimeForClasses.electrochemistry_P: 15,
                                                            TimeForClasses.languageC1_F: 15,
                                                            TimeForClasses.languageC1_P: 15,
                                                            TimeForClasses.fundamentalsOfChemicalAnalysis_F : 0,
                                                            TimeForClasses.fundamentalsOfChemicalAnalysis_P : 0 ],
                                          academycHoursLab: [ TimeForClasses.electrochemistry_F: 10,
                                                         TimeForClasses.electrochemistry_P: 30,
                                                         TimeForClasses.languageC1_F: 10,
                                                         TimeForClasses.languageC1_P: 30,
                                                         TimeForClasses.fundamentalsOfChemicalAnalysis_F : 10,
                                                         TimeForClasses.fundamentalsOfChemicalAnalysis_P : 30
                                          ])
        
        return destinationModel
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToPersonalLerningPlan" else { return }
        let mainVC = segue.destination as! LessonViewController
        mainVC.tearmModel = modelForDestination()
    }
}

