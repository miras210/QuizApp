//
//  Question.swift
//  QuizApp
//
//  Created by Miras Alimov on 26.01.2021.
//

import Foundation

public struct Question: Codable {
    let id: Int?
    let question: String?
    let ans: [String?]
    let correctAns: Int?
    var chosen: Int?
}
