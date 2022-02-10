//
//  TASK.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//

import Foundation

//TODO: заполнени модели 6 семестра из task

class Task {
    var dawnloadURL: String?
    var learningYear: String?
    var learningTearm: [String]?
    var nameDiscipline: [String]?
    var hoursF: [String]?
    var hoursR: [String]?
    
    func task(urlString: String){
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { [unowned self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                do {
                    let lessons = try JSONDecoder().decode(ModelJSON.self, from: data)
                    dawnloadURL = lessons.documentURL
                    learningYear = lessons.academicYear
                    //[Semester]
                    let semesters = lessons.semesters
                    for semester in semesters {
                        learningTearm?.append(semester.number)
                    }
                    //[Disciplines]
                    for semester in semesters {
                        let disciplineInSemester = semester.disciplines
                        for disciplineName in disciplineInSemester{
                            let disciplineName = disciplineName.disciplineName.nameRu
                            nameDiscipline?.append(disciplineName)
                        }
                        //[Lesson]
                        for lesson in disciplineInSemester{
                            let lessonInSemesters = lesson.lesson
                            //[Hours]
                            for hours in lessonInSemesters{
                                hoursF?.append(hours.hours)
                                hoursR?.append(hours.realHours)
                            }
                        }
                    }
                } catch {
                    print(error)
                }
            } else {
                return
            }
            if let response = response{
                print(response)
            }
        }.resume()
    }
    
    func createMainScrean() -> ModelTearm?{
        guard let dawnloadURL = dawnloadURL else { return nil}
        guard let learningYear = learningYear else { return nil}
        guard let learningTearm = learningTearm else { return nil}
        guard let nameDiscipline = nameDiscipline else { return nil}
        guard let hoursF = hoursF else { return nil}
        guard let hoursR = hoursR else { return nil}
        
        let sequenseFact = transfrormHoursToInt(hoursF)
        let sequenseReal = transfrormHoursToInt(hoursR)
        
        //Ужасно, но нет времени переписать модель
        let leraningPlan = ModelTearm(
            learningYear: learningYear,
            learningTearm: learningTearm,
            nameOfDiscipline: nameDiscipline,
            academycHoursLectio: [TimeForClasses.electrochemistry_F: sequenseFact[0],
                                  TimeForClasses.languageC1_F: sequenseFact[1],
                                  TimeForClasses.fundamentalsOfChemicalAnalysis_F: sequenseFact[2],
                                  TimeForClasses.electrochemistry_P : sequenseReal[0],
                                  TimeForClasses.languageC1_P : sequenseReal[1],
                                  TimeForClasses.fundamentalsOfChemicalAnalysis_P: sequenseFact[2]
                                 ],
            academycHoursSeminar: [TimeForClasses.electrochemistry_F: sequenseFact[3],
                                   TimeForClasses.languageC1_F: sequenseFact[4],
                                   TimeForClasses.fundamentalsOfChemicalAnalysis_F: sequenseFact[5],
                                   TimeForClasses.electrochemistry_P : sequenseReal[3],
                                   TimeForClasses.languageC1_P : sequenseReal[3],
                                   TimeForClasses.fundamentalsOfChemicalAnalysis_P: sequenseFact[4]
                                   ],
            academycHoursLab: [TimeForClasses.electrochemistry_F: sequenseFact[6],
                                   TimeForClasses.languageC1_F: sequenseFact[7],
                                   TimeForClasses.fundamentalsOfChemicalAnalysis_F: sequenseFact[8],
                                   TimeForClasses.electrochemistry_P : sequenseReal[6],
                                   TimeForClasses.languageC1_P : sequenseReal[7],
                                   TimeForClasses.fundamentalsOfChemicalAnalysis_P: sequenseFact[8]
                               ],
            urlForDownLoad: dawnloadURL)
        return leraningPlan
    }

    private func transfrormHoursToInt(_ hours: [String]) -> [Int]{
        var intHours: [Int] = []
        for hour in hours { intHours.append(Int(hour) ?? 0) }
        return intHours
    }
    
}

