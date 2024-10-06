import SwiftUI

struct WorkoutBoxDisplay: View {
    @EnvironmentObject var workoutDataModel: WorkoutDataModel
    @State var workout: Workout
    @State private var showDeleteButton = false

    var body: some View {
        ZStack {
            // White Box
            Rectangle()
                .frame(width: ((UIScreen.main.bounds.width) / 2) - 15, height: 75.0)
                .cornerRadius(15)
                .foregroundColor(.white)
            
            // Black Line
            Rectangle()
                .frame(width: ((UIScreen.main.bounds.width) / 2) - 15, height: 7.5)
                .cornerRadius(15)
                .offset(y: -10)
            
            // Name of Workout
            Text(workout.exercise)
                .font(.title)
                .offset(y: -25)
            
            // Number of Reps
            Text(workout.number)
                .font(.largeTitle)
                .fontWeight(.bold)
                .offset(y: 15)
            
            if showDeleteButton {
                Button(action: {
                    workoutDataModel.removeWorkout(id: workout.id)
                }) {
                    Text("Delete")
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }
                //.offset(x: UIScreen.main.bounds.width / 2 - 100, y: -37)
            }
        }
        .onTapGesture {
            withAnimation {
                showDeleteButton.toggle()
            }
        }
    }
}

#Preview {
    WorkoutBoxDisplay(workout: Workout(exercise: "Bench Press", typeOfWorkout: [], number: "10", index: 0))
}
