//
//  Category.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 18.09.2024.
//

import Foundation

// MARK: - Category
struct MainCategories: Codable {
    let id: Int?
    let exerciseName: String?
    let mainCategory: Int?
    let subCategories: [MainCategories]?

    enum CodingKeys: String, CodingKey {
        case id
        case exerciseName = "exercise_name"
        case mainCategory = "main_category"
        case subCategories = "sub_categories"
    }
}

typealias Categories = [MainCategories]




// MARK: - MainCategory
struct MainCategory: Codable {
    let id: Int?
    let exerciseName: String?
    let mainCategory: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case exerciseName = "exercise_name"
        case mainCategory = "main_category"
    }
}

typealias MainCategories = [MainCategory]
