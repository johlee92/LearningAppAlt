//
//  ContentModel.swift
//  LearningAppAlt
//
//  Created by Johnathan Lee on 4/25/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var lessons = [Lesson]()
    @Published var searchText = ""
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        let pathString = Bundle.main.url(forResource: "data", withExtension: "json")
        
        guard pathString != nil else {
            print("pathString is nil")
            return
        }
        
        do {
            let data = try Data(contentsOf: pathString!)
            let decoder = JSONDecoder()
            
            do {
                let lessonData = try decoder.decode([Lesson].self, from: data)
                self.lessons = lessonData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    
}
