//
//  Exercise.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 18.09.2024.
//

import Foundation

// MARK: - Exercise
struct Exercise: Codable {
    let id: Int?
    let exerciseName: String?
    let exerciseCategory: Int?
    let exerciseImg, exerciseGIF, exerciseDescription: String?
    let exerciseLevel, exerciseTime, exerciseSet, exerciseRep: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case exerciseName = "exercise_name"
        case exerciseCategory = "exercise_category"
        case exerciseImg = "exercise_img"
        case exerciseGIF = "exercise_gif"
        case exerciseDescription = "exercise_description"
        case exerciseLevel = "exercise_level"
        case exerciseTime = "exercise_time"
        case exerciseSet = "exercise_set"
        case exerciseRep = "exercise_rep"
    }
}

typealias Exercises = [Exercise]
