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
    
    func createMainScrean(){
        guard let dawnloadURL = dawnloadURL else { return }
        guard let learningYear = learningYear else { return }
        guard let learningTearm = learningTearm else { return }
        guard let nameDiscipline = nameDiscipline else { return }
        guard let hoursF = hoursF else { return }
        guard let hoursR = hoursR else { return }
        
        
        
        
        let leraningPlan = ModelTearm(
            learningYear: learningYear,
            learningTearm: learningTearm,
            nameOfDiscipline: nameDiscipline,
            academycHoursLectio: <#T##[TimeForClasses : Int]#>,
            academycHoursSeminar: <#T##[TimeForClasses : Int]#>,
            academycHoursLab: <#T##[TimeForClasses : Int]#>,
            urlForDownLoad: dawnloadURL)


    }
}
