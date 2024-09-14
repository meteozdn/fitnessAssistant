// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userModel = try? JSONDecoder().decode(UserModel.self, from: jsonData)

import Foundation

// MARK: - UserModelElement
struct UserModelElement: Codable {
    let id: Int?
    let name, surname, username, eposta: String?
    let gender: Int?
}

typealias UserModel = [UserModelElement]



// MARK: - Exercise
struct Exercise: Codable {
    let id: Int?
    let exerciseName: String?
    let exerciseCategory: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case exerciseName = "exercise_name"
        case exerciseCategory = "exercise_category"
    }
}

typealias ExerciseModel = [Exercise]
