import SwiftUI
import Combine

class WorkoutDataModel: ObservableObject {
    @Published var workoutData: [Workout] = [] {
        didSet {
            saveWorkouts()
        }
    }
    
    private let workoutsKey = "workoutsKey"
    
    init() {
        loadWorkouts()
    }
    
    // Save workouts to UserDefaults
    func saveWorkouts() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(workoutData) {
            UserDefaults.standard.set(encoded, forKey: workoutsKey)
        }
    }
    
    // Load workouts from UserDefaults
    func loadWorkouts() {
        let decoder = JSONDecoder()
        if let savedWorkouts = UserDefaults.standard.object(forKey: workoutsKey) as? Data {
            if let loadedWorkouts = try? decoder.decode([Workout].self, from: savedWorkouts) {
                workoutData = loadedWorkouts
            }
        }
    }
    
    // Remove workout by UUID
    func removeWorkout(id: UUID) {
        if let index = workoutData.firstIndex(where: { $0.id == id }) {
            workoutData.remove(at: index)
        }
    }
}
