//
//  ContentView.swift
//  LearningAppAlt
//
//  Created by Johnathan Lee on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            
            VStack (alignment: .leading) {
                
                List {
                    ForEach(lessonResults) {
                        lesson in
                        NavigationLink(destination: ContentDetailView(lesson: lesson), label: {
                                Text("\(lesson.title)")
                        })
                    }
                }
                .listStyle(PlainListStyle())
                .searchable(text: $model.searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
            .navigationTitle("Lessons")
        }
    }
    
    var lessonResults:[Lesson] {
        if model.searchText == "" {
            return model.lessons
        } else {
            print(model.searchText)
            return model.lessons
                .filter({ model.searchText.isEmpty ? true : $0.title.localizedCaseInsensitiveContains(model.searchText) })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
