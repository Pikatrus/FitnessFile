//
//  Gym_PR_TrackerApp.swift
//  Gym PR Tracker
//
//  Created by Jafar Abdulkader on 8/4/24.
//

import SwiftUI
import SwiftData


@main
struct GymPRTrackerApp: App {
    @StateObject private var workoutDataModel = WorkoutDataModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(workoutDataModel)
                .preferredColorScheme(.light) // Force light mode
        }
    }
}
