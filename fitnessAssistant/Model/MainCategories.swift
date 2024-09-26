//
//  Category.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 18.09.2024.
//

import Foundation


// MARK: - MainCategory
struct Category: Codable {
    let id: Int?
    let exerciseName: String?
    let mainCategory: Int?
    let categoriesDescription: String?
    let subCategories: [Category]?

    enum CodingKeys: String, CodingKey {
        case id
        case exerciseName = "exercise_name"
        case mainCategory = "main_category"
        case categoriesDescription = "categories_description"
        case subCategories = "sub_categories"
    }
}

typealias MainCategories = [Category]

