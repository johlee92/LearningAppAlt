//
//  ContentDetailView.swift
//  LearningAppAlt
//
//  Created by Johnathan Lee on 4/25/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    var lesson:Lesson
    
    // sample.mp4 is 1920 x 1080
    let videoRatio: CGFloat = 1080 / 1920
    
    var body: some View {
        
        GeometryReader {
            geo in
            VStack (alignment: .leading) {
                
                Text(lesson.title)
                    .bold()
                    .font(.largeTitle)
                
                if let url = URL(string: lesson.url) {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geo.size.width*videoRatio)
                }
                
            }
            .padding()
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(lesson: Lesson(id: 1, title: "How To Make An App for Beginners 2021 / SwiftUI - Lesson 1", url: "https://codewithchris.github.io/Module5Challenge/Lesson%201.mp4"))
    }
}
