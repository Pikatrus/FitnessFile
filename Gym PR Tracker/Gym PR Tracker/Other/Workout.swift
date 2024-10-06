//
//  Workout.swift
//  Gym PR Tracker
//
//  Created by Jafar Abdulkader on 8/6/24.
//


import Foundation

struct Workout: Identifiable, Codable {
    let id = UUID()
    var exercise: String
    var typeOfWorkout: Set<String>
    var number: String
    var index: Int
}

