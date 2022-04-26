//
//  Model.swift
//  LearningAppAlt
//
//  Created by Johnathan Lee on 4/25/22.
//

import Foundation

struct Lesson:Identifiable, Decodable {
    var id:Int
    var title:String
    var url:String
}
