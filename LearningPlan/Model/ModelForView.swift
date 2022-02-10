//
//  ModelForView.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//

import Foundation


//enum Classes: String {
//    case electrochemistry = "Электрохимия \n(на англ. яз)"
//    case languageC1 = "Иностранный язык С1"
//    case fundamentalsOfChemicalAnalysis = "Основы химического анализа"
//}

enum TimeForClasses: Hashable{
    case electrochemistry_F
    case electrochemistry_P
    case languageC1_F
    case languageC1_P
    case fundamentalsOfChemicalAnalysis_F
    case fundamentalsOfChemicalAnalysis_P
}

struct ModelTearm {
    var urlForDownload: String?
    var learningYear: String
    var learningTearm: [String]
    var nameOfDiscipline: [String]
    var academycHoursLectio: [TimeForClasses: Int]
    var academycHoursSeminar: [TimeForClasses: Int]
    var academycHoursLab: [TimeForClasses: Int]
    var urlForDownLoad: String?
}
