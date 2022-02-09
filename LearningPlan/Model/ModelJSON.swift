//
//  Model.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//

import Foundation

struct ModelJSON: Decodable {
    let iupSid, title, documentURL, academicYearID: String
    let academicYear: String
    let semesters: [Semester]
    
    enum CodingKeys: String, CodingKey {
        case iupSid = "IUPSid"
        case title = "Title"
        case documentURL = "DocumentURL"
        case academicYearID = "AcademicYearId"
        case academicYear = "AcademicYear"
        case semesters = "Semesters"
    }
}

// MARK: - Semester
struct Semester: Decodable {
    let number: String
    let disciplines: [Discipline]
    
    enum CodingKeys: String, CodingKey {
        case number = "Number"
        case disciplines = "Disciplines"
    }
}

// MARK: - Discipline
struct Discipline: Decodable {
    let disciplineID: String
    let disciplineName: DisciplineName
    let lesson: [Lesson]
    
    enum CodingKeys: String, CodingKey {
        case disciplineID = "DisciplineId"
        case disciplineName = "DisciplineName"
        case lesson = "Lesson"
    }
}

// MARK: - DisciplineName
struct DisciplineName: Decodable {
    let nameKk, nameRu, nameEn: String
}

// MARK: - Lesson
struct Lesson: Decodable {
    let lessonTypeID, hours, realHours: String
    
    enum CodingKeys: String, CodingKey {
        case lessonTypeID = "LessonTypeId"
        case hours = "Hours"
        case realHours = "RealHours"
    }
}

