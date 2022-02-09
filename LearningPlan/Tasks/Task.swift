//
//  TASK.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//

import Foundation

class Task {
    
    let urlString = ""
    
    func setupModelFromTask(){
        
    }
    
    
    func task(){
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let lessons = try JSONDecoder().decode([ModelJSON].self, from: data)
                    
                } catch {
                    print(error)
                }
                
                
            } else {
                return
                
            }
            
        }.resume()
    }
}
